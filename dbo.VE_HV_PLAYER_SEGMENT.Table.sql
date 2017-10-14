/*    ==Scripting Parameters==

    Source Server Version : Version120 (12.0.2000)
    Source Database Engine Edition : Enterprise
    Source Database Engine Type : Standalone

    Target Server Version : Version130
    Target Database Engine Edition : Enterprise
    Target Database Engine Type : Standalone
*/
USE [HostViz_IGT_Template]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_PLAYER_SEGMENT](
	[RowID] [varchar](36) NULL,
	[VersionNum] [int] NULL,
	[SegmentID] [varchar](36) NOT NULL,
	[PlayerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC,
	[SegmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE TRIGGER [dbo].[bis2_trg_hv_player_segment_del_trg]
  ON [dbo].[VE_HV_PLAYER_SEGMENT]
  AFTER DELETE AS
  -- v. 20150422-01/v5  Alexey Maksimov  Fixed join condition to avoid removal
  --                                     of extra records
  BEGIN
    --delete from BIS2_HV_TASK
    UPDATE BIS2_MT_HV_TASK
      SET Status = 'Unassigned'
      WHERE BIS2_MT_HV_TASK.TaskID IN (
        SELECT task.TaskID
          FROM DELETED AS d
            INNER JOIN BIS2_MT_HV_ACTION_GENERATION AS Gen
              ON d.SegmentID = Gen.SegmentID
            INNER JOIN BIS2_MT_HV_TASK as task 
              ON Gen.ActionGenerationID = task.ActionGenerationID
          WHERE task.PlayerID = d.PlayerID
      )
      AND NOT Status = 'Closed' AND NOT Status = 'Unassigned';
  END;



GO
ALTER TABLE [dbo].[VE_HV_PLAYER_SEGMENT] ENABLE TRIGGER [bis2_trg_hv_player_segment_del_trg]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[bis2_trg_hv_player_segment_ins_trg]
ON [dbo].[VE_HV_PLAYER_SEGMENT]
  AFTER INSERT
AS
--
-- The following Intellectual Property Notice applies to all software code below
-- and replaces any similar notice contained in this software.

-- Intellectual Property Notice
--
-- (c) 2015 Business Intelligence Systems Solutions Holdings B.V. - All rights reserved.
--
-- The BIS2 software code below is a component of Business Intelligence Systems Solutions, Inc.’s
-- gameViz(TM) software product (which may include, but is not limited to, gameViz(TM) modules floorViz(TM)
-- and aimViz(TM)) and is licensed to you as a BIS2 customer or user subject to the terms and
-- conditions of BIS2's standard End User License Agreement a copy of which is located on BIS2's website
-- www.vizexplorer.com.  By using the code you agree that you have read and accepted the terms and conditions of
-- BIS2 standard End User License Agreement.
--
-- 20150330-01/v2  Alexey Maksimov


BEGIN

  DECLARE @ActionGenerationID VARCHAR(36);
  -- in MS SQL Server use NEWID()
  -- in Oracle use SYS.STANDARD.TO_CHAR( SYS_GUID() )
  -- in MySQL use UUID()
  -- in DB2 use GENERATE_UNIQUE()
  -- PostgreSQL requires the uuid contrib extension to be loaded, then
  -- CAST(uuid_generate_v1() as varchar(36) OR (cheat)
  -- SELECT uuid_in(md5(random()::text || now()::text)::cstring)

  DECLARE @PlayerID int;
  DECLARE @SegmentID VARCHAR(36);

  -- Loading date into a variable so all the INSERT's look atomic
  DECLARE @CurDate DATETIME;
  SET @CurDate = GETDATE();

  DECLARE @v_l_UsernameLastModified varchar(25);
  DECLARE @v_l_ActionTemplateID varchar(36);
  DECLARE @v_l_GenerateType varchar(15);
  DECLARE @v_l_GenerateSubType varchar(20);
  DECLARE @v_l_Description varchar(120);
  DECLARE @v_l_Priority smallint;
  DECLARE @v_l_StartFromDate datetime;
  DECLARE @v_l_DueDate datetime;
  DECLARE @v_l_AssignHostBehavior varchar(12);
  DECLARE @v_l_HostIDAssign varchar(36);
  DECLARE @v_l_TriggerEventType varchar(15);
  DECLARE @v_l_TriggerEventSubType varchar(20);
  DECLARE @v_l_SegName varchar(30);
  DECLARE @v_l_SegType varchar(15);
  DECLARE @v_l_Name varchar(25);
  
  DECLARE inserted_cur CURSOR FOR
    SELECT
      DISTINCT Template.UsernameLastModified, Template.ActionTemplateID, Template.GenerateType,Template.Name,
      Template.GenerateSubType, Template.Description, Template.Priority, Template.StartFromDate, Template.DueDate,
      Template.AssignHostBehavior, Template.HostIDAssign,
      Template.TriggerEventType, Template.TriggerEventSubType, Segment.SegmentID,
      Segment.Name, Segment.Type, i.PlayerID
    FROM
      inserted AS i
      INNER JOIN BIS2_MT_hv_segment AS Segment ON Segment.SegmentID = i.SegmentID
      INNER JOIN BIS2_MT_HV_ACTION_TEMPLATE_SEGMENT AS ats ON ats.SegmentID = i.SegmentID
      INNER JOIN BIS2_MT_HV_VE_ACTION_FACTORY_TEMPLATE AS Template ON ats.ActionTemplateID = Template.ActionTemplateID
    WHERE (Template.DissolveDate IS NULL OR Template.DissolveDate > @CurDate);

  DECLARE @HostCount BIGINT;

  OPEN inserted_cur;

  WHILE 1 = 1 BEGIN

    FETCH NEXT FROM inserted_cur INTO
      @v_l_UsernameLastModified, @v_l_ActionTemplateID, @v_l_GenerateType,@v_l_Name,
      @v_l_GenerateSubType, @v_l_Description, @v_l_Priority, @v_l_StartFromDate, @v_l_DueDate,
      @v_l_AssignHostBehavior, @v_l_HostIDAssign,
      @v_l_TriggerEventType, @v_l_TriggerEventSubType, @SegmentID,
      @v_l_SegName, @v_l_SegType, @PlayerID;

    IF (@@FETCH_STATUS <> 0) BREAK;

    SET @ActionGenerationID = NEWID();

    -- store details of generation (action factory) process in a new BIS2_MT_HV_ACTION_GENERATION row
    -- Cartesian product of 1 row from BIS2_MT_HV_VE_ACTION_FACTORY_TEMPLATE x 1 row from BIS2_MT_hv_segment
  	
    INSERT INTO BIS2_MT_HV_ACTION_GENERATION (
      ActionGenerationID, UsernameLastModified, ActionTemplateID, GenerateType, Name,
      GenerateSubType, Description, Priority, StartFromDate, DueDate,
      AssignHostBehavior, HostIDAssign,
      TriggerEventType, TriggerEventSubType, SegmentID,
      SegmentName, SegmentType, SourceActionReason, CreateDate, VersionNum
    )
    VALUES (
      @ActionGenerationID, @v_l_UsernameLastModified, @v_l_ActionTemplateID, @v_l_GenerateType,@v_l_Name,
      @v_l_GenerateSubType, @v_l_Description, @v_l_Priority, @v_l_StartFromDate, @v_l_DueDate,
      @v_l_AssignHostBehavior, @v_l_HostIDAssign,
      @v_l_TriggerEventType, @v_l_TriggerEventSubType, @SegmentID,
      @v_l_SegName, @v_l_SegType, 'player-segment ins trig', @CurDate, 1
    );

    BEGIN

      BEGIN TRANSACTION;

      -- Manual override of JOIN-with-analytic-function-and-percent-bug

      DECLARE @v_PlayerID int;
      DECLARE @v_HostID varchar(50);
      DECLARE @v_AssignHostBehavior varchar(12);
      DECLARE @v_HostIDAssign varchar(36);
      DECLARE @v_Type varchar(20);
      DECLARE @v_Description varchar(120);
      DECLARE @v_DueDate datetime;
      DECLARE @v_StartFromDate datetime;
      DECLARE @v_Priority smallint;
      DECLARE @v_DissolveDate datetime;
  	  DECLARE @v_Name varchar(25);

      DECLARE users_cur CURSOR FOR
        SELECT
          SegmentPlayerHost.PlayerID, SegmentPlayerHost.HostID,
          Tmpl.AssignHostBehavior, Tmpl.HostIDAssign,Tmpl.Name,
          Tmpl.GenerateSubType AS Type, Tmpl.Description, Tmpl.DueDate, Tmpl.StartFromDate, Tmpl.Priority,
          Tmpl.DissolveDate
        FROM
          (
            SELECT * FROM BIS2_MT_HV_VE_ACTION_FACTORY_TEMPLATE
              WHERE ActionTemplateID = @v_l_ActionTemplateID
          ) AS Tmpl
          CROSS JOIN (
            SELECT b2ps.PlayerID, b2ph.HostID
              FROM BIS2_MT_hv_player_segment as b2ps
                LEFT JOIN BIS2_VW_HV_PlayerHost as b2ph
                  ON b2ps.PlayerID = b2ph.PlayerID
              WHERE b2ps.SegmentID = @SegmentID AND b2ps.PlayerID = @PlayerID
          ) AS SegmentPlayerHost
        ORDER BY ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT));

      DECLARE @v_GenHostID varchar(50);
      DECLARE @v_EndOfHostsListReached int;
      SET @v_EndOfHostsListReached = 0;

      -- Data source for randomized host list
      DECLARE hosts_cur CURSOR FOR
        SELECT HostID
        FROM BIS2_MT_HV_VIP_Host -- BIS2_VW_Hosts
        ORDER BY ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT));

      OPEN users_cur;
      OPEN hosts_cur;

      WHILE 1 = 1 BEGIN

        FETCH NEXT FROM users_cur INTO
          @v_PlayerID, @v_HostID, @v_AssignHostBehavior, /*@v_AssignHostBehaviorOverflow,*/ 
          @v_HostIDAssign, @v_Name,
          /*@v_HostIDAssignOverflow,*/ @v_Type, @v_Description, @v_DueDate,
          @v_StartFromDate, @v_Priority, @v_DissolveDate;

        IF (@@FETCH_STATUS <> 0) BREAK;

        IF @v_EndOfHostsListReached > 0
          SET @v_GenHostID = NULL
        ELSE BEGIN
          FETCH NEXT FROM hosts_cur INTO @v_GenHostID;
          IF (@@FETCH_STATUS <> 0) BEGIN
            CLOSE hosts_cur;
            OPEN hosts_cur;
            FETCH NEXT FROM hosts_cur INTO @v_GenHostID;
            IF (@@FETCH_STATUS <> 0) BEGIN
              SET @v_EndOfHostsListReached = 1;
              SET @v_GenHostID = NULL
            END;
          END;
        END;

        INSERT INTO BIS2_MT_HV_TASK (
          TaskID, PlayerID,
          HostID,
          ActionGenerationID, Type, Description, Name,
          DueDate, StartFromDate, Priority,
          Status, DissolveDate,
          CreateDate, ModifiedDate, VersionNum
        ) VALUES (
          NEWID(), @v_PlayerID,
          --@v_GenHostID
          -- CASE
          -- WHEN @v_HostID IS NOT NULL THEN                                   -- for hosted
            CASE
              WHEN @v_AssignHostBehavior = 'specific' THEN @v_HostIDAssign  -- specific = Host defined in the template
              WHEN @v_AssignHostBehavior = 'random' THEN @v_GenHostID       -- random = Random amongst all hosts
              ELSE COALESCE(@v_HostID, @v_GenHostID)                        -- default/unimplemented = Player's host
            END
          -- ELSE
          --   CASE                                                            -- for unhosted
          --     WHEN @v_AssignHostBehaviorOverflow = 'specific' THEN          -- specific = Host defined in the template
          --       @v_HostIDAssignOverflow
          --     WHEN @v_AssignHostBehaviorOverflow = 'random' THEN            -- random = Random amongst all hosts
          --       @v_GenHostID
          --     ELSE NULL                                                     -- default/unimplemented = NULL
          --   END
          -- END
          , @ActionGenerationID, @v_Type, @v_Description,@v_Name,
          @v_DueDate, @v_StartFromDate, @v_Priority,
          'unactioned', @v_DissolveDate,
          @CurDate, @CurDate, 1
        );

      END;

      CLOSE users_cur;
      DEALLOCATE users_cur;
      CLOSE hosts_cur;
      DEALLOCATE hosts_cur;

      COMMIT;

    END;

  END;

  CLOSE inserted_cur;
  DEALLOCATE inserted_cur;

END;
GO
ALTER TABLE [dbo].[VE_HV_PLAYER_SEGMENT] ENABLE TRIGGER [bis2_trg_hv_player_segment_ins_trg]
GO
