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
CREATE TABLE [dbo].[VE_HV_ACTION_TEMPLATE_SEGMENT](
	[ActionTemplateID] [varchar](36) NOT NULL,
	[SegmentID] [varchar](36) NOT NULL,
	[RowID] [varchar](36) NULL,
	[VersionNum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActionTemplateID] ASC,
	[SegmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE TRIGGER [dbo].[bis2_trg_hv_template_segment_del_trg] ON [dbo].[VE_HV_ACTION_TEMPLATE_SEGMENT]
AFTER DELETE
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
-- v. 20150422-01/v5  Alexey Maksimov  Fixed join condition to avoid removal
--                                     of extra records
BEGIN
	UPDATE BIS2_MT_HV_TASK
	SET STATUS = 'Unassigned'
	FROM BIS2_MT_HV_TASK t
	INNER JOIN BIS2_MT_HV_ACTION_GENERATION ag
		ON ag.actiongenerationid = t.actiongenerationid
	INNER JOIN DELETED d
		ON d.ActionTemplateID = ag.ActionTemplateID
			AND d.SegmentID = ag.SegmentID
	WHERE NOT t.STATUS = 'Closed'
		AND NOT t.STATUS = 'Unassigned'
END;


GO
ALTER TABLE [dbo].[VE_HV_ACTION_TEMPLATE_SEGMENT] ENABLE TRIGGER [bis2_trg_hv_template_segment_del_trg]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Highlight and execute the following statement to drop the trigger
before executing the create statement.

DROP TRIGGER dbo.bis2_trg_hv_template_segment_ins_trg;

*/


CREATE TRIGGER [dbo].[bis2_trg_hv_template_segment_ins_trg]
  ON [dbo].[VE_HV_ACTION_TEMPLATE_SEGMENT]
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
-- 20150330-01 (v2) Alexey Maksimov

BEGIN

  DECLARE @ActionGenerationID VARCHAR(36)

  DECLARE @ActionTemplateID VARCHAR(36)
  DECLARE @SegmentID VARCHAR(36)

  -- Loading date into a variable so all the INSERT's look atomic
  DECLARE @CurDate DATETIME
  SET @CurDate = GETDATE()

  DECLARE inserted_cur CURSOR
    FOR SELECT ActionTemplateID, SegmentID FROM inserted;

  DECLARE @HostCount BIGINT;

  OPEN inserted_cur;

  WHILE 1 = 1 BEGIN

    FETCH NEXT FROM inserted_cur INTO @ActionTemplateID, @SegmentID;

    IF (@@FETCH_STATUS <> 0) BREAK;

    SET @ActionGenerationID = NEWID();

    BEGIN TRANSACTION;
 
    -- store details of generation (action factory) process in a new BIS2_MT_HV_ACTION_GENERATION row
    -- Cartesian product of 1 row from BIS2_VE_ACTION_FACTORY_TEMPLATE x 1 row from BIS2_hv_segment
  	
    INSERT INTO BIS2_MT_HV_ACTION_GENERATION (
      ActionGenerationID, UsernameLastModified, ActionTemplateID, GenerateType,Name,
      GenerateSubType, Description, Priority, StartFromDate, DueDate,
      AssignHostBehavior, /*AssignHostBehaviorOverflow,*/ HostIDAssign,
      /*HostIDAssignOverflow,*/ TriggerEventType, TriggerEventSubType, SegmentID,
      SegmentName, SegmentType, SourceActionReason, CreateDate, VersionNum
    )
    SELECT
      DISTINCT @ActionGenerationID, Template.UsernameLastModified, Template.ActionTemplateID, Template.GenerateType,Template.Name,
      Template.GenerateSubType, Template.Description, Template.Priority, Template.StartFromDate, Template.DueDate,
      Template.AssignHostBehavior, /*Template.AssignHostBehaviorOverflow,*/ Template.HostIDAssign,
      /*Template.HostIDAssignOverflow,*/ Template.TriggerEventType, Template.TriggerEventSubType, Segment.SegmentID,
      Segment.Name, Segment.Type, 'template-segment ins trig', @CurDate, 1
    FROM
      (SELECT * FROM BIS2_MT_HV_SEGMENT WHERE SegmentID = @SegmentID) AS Segment
      CROSS JOIN (
        SELECT * FROM BIS2_MT_HV_VE_ACTION_FACTORY_TEMPLATE
        WHERE ActionTemplateID = @ActionTemplateID
          AND (DissolveDate IS NULL OR DissolveDate > @CurDate)
      ) AS Template
  	
    -- 0 rows = inconsistent data (missing BIS2_hv_segment or BIS2_VE_ACTION_FACTORY_TEMPLATE record)
    -- > 1 rows = inconsistent data (whatever should be unique is not)
    
    IF @@ROWCOUNT = 1 BEGIN

      -- Manual override of JOIN-with-analytic-function-and-percent-bug

      DECLARE @v_PlayerID int;
      DECLARE @v_HostID varchar(50);
      DECLARE @v_AssignHostBehavior varchar(12);
      -- DECLARE @v_AssignHostBehaviorOverflow varchar(12);
      DECLARE @v_HostIDAssign varchar(36);
      -- DECLARE @v_HostIDAssignOverflow varchar(36);
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
          Tmpl.AssignHostBehavior, /*Tmpl.AssignHostBehaviorOverflow,*/ Tmpl.HostIDAssign, /*Tmpl.HostIDAssignOverflow,*/ Tmpl.Name,
          Tmpl.GenerateSubType AS Type, Tmpl.Description, Tmpl.DueDate, Tmpl.StartFromDate, Tmpl.Priority,
          Tmpl.DissolveDate
        FROM
          (
            SELECT * FROM BIS2_MT_HV_VE_ACTION_FACTORY_TEMPLATE
              WHERE ActionTemplateID = @ActionTemplateID
                AND (DissolveDate IS NULL OR DissolveDate > @CurDate)
          ) AS Tmpl
          CROSS JOIN (
            SELECT b2ps.PlayerID, b2ph.HostID
              FROM BIS2_MT_HV_PLAYER_SEGMENT as b2ps
                LEFT JOIN BIS2_VW_HV_PlayerHost as b2ph
                  ON b2ps.PlayerID = b2ph.PlayerID
              WHERE b2ps.SegmentID = @SegmentID
          ) AS SegmentPlayerHost
        ORDER BY ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT));

      DECLARE @v_GenHostID varchar(50);
      DECLARE @v_EndOfHostsListReached int;
      SET @v_EndOfHostsListReached = 0;

      -- Data source for randomized host list
      DECLARE hosts_cur CURSOR FOR
        SELECT HostID
        FROM BIS2_MT_HV_VIP_HOST -- BIS2_VW_Hosts
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
          ActionGenerationID, Type, Description,Name,
          DueDate, StartFromDate, Priority,
          Status, DissolveDate,
          CreateDate, ModifiedDate, VersionNum
        ) VALUES (
          NEWID(), @v_PlayerID,
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
          , @ActionGenerationID, @v_Type, @v_Description,@v_Name,
          @v_DueDate, @v_StartFromDate, @v_Priority,
          'unactioned', @v_DissolveDate,
          @CurDate, @CurDate, 1
        );

      END;

      CLOSE users_cur;
      DEALLOCATE users_cur;
      CLOSE hosts_cur;
      DEALLOCATE hosts_cur;

    END;

    COMMIT;

  END;

  CLOSE inserted_cur;
  DEALLOCATE inserted_cur;

END;
GO
ALTER TABLE [dbo].[VE_HV_ACTION_TEMPLATE_SEGMENT] ENABLE TRIGGER [bis2_trg_hv_template_segment_ins_trg]
GO
