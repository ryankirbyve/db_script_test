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
CREATE TABLE [dbo].[VE_HV_ACTION_FACTORY_TEMPLATE](
	[ActionTemplateID] [varchar](36) NOT NULL,
	[UsernameLastModified] [varchar](25) NULL,
	[GenerateType] [varchar](15) NULL,
	[GenerateSubType] [varchar](20) NULL,
	[Description] [varchar](120) NULL,
	[Priority] [smallint] NULL,
	[StartFromDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[AssignHostBehavior] [varchar](12) NOT NULL,
	[AssignHostBehaviorOverflow] [varchar](12) NOT NULL,
	[HostIDAssign] [varchar](36) NULL,
	[HostIDAssignOverflow] [varchar](36) NULL,
	[TemplateCreateDate] [datetime] NULL,
	[TemplateModifiedDate] [datetime] NULL,
	[TriggerEventType] [varchar](15) NULL,
	[TriggerEventSubType] [varchar](20) NULL,
	[DissolveDate] [datetime] NULL,
	[VersionNum] [int] NULL,
	[Name] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActionTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VE_HV_ACTION_FACTORY_TEMPLATE] ADD  DEFAULT ('default') FOR [AssignHostBehavior]
GO
ALTER TABLE [dbo].[VE_HV_ACTION_FACTORY_TEMPLATE] ADD  DEFAULT ('specific') FOR [AssignHostBehaviorOverflow]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Highlight and execute the following statement to drop the trigger
before executing the create statement.

DROP TRIGGER dbo.trg_BIS2_Template_Delete;

*/

CREATE TRIGGER [dbo].[trg_BIS2_Template_Delete]
ON  [dbo].[VE_HV_ACTION_FACTORY_TEMPLATE] 
AFTER Delete
AS 

/*==================================================================================================================================
   The following Intellectual Property Notice applies to all software code below and replaces any
   similar notice contained in this software.
   Intellectual Property Notice
    
   Copyright (c) 2014 -  NEW BIS SAFE LUXCO S.A.R.L - All rights reserved.
  
   The VizExplorer code below is a component of VizExplorer's gameViz(tm) software solution (which may 
   include, but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed to 
   you as a VizExplorer customer or user subject to the terms and conditions of VizExplorer's standard 
   End User License Agreement a copy of which is located on VizExplorer's website at 
   http://www.vizexplorer.com/license-agreements/ 
   By using the code you agree that you have read and accepted the terms and conditions of the 
   VizExplorer standard End User License Agreement.
=====================================================================================================
	26 January 2015		Judy Schroeder		Deletes task template and associated segments and tasks
	26 March 2015		Glenn Benge 		removed delete from BIS2_VE_ACTION_FACTORY_TEMPLATE

=====================================================================================================*/

	DECLARE @ActionTemplateID	varchar(36)
		,	@ActionGenerationID varchar(36)
		
	SELECT @actionTemplateID = deleted.ActionTemplateID FROM Deleted	
	--LEFT JOIN BIS2_VE_ACTION_FACTORY_TEMPLATE t on d.ActionTemplateID = t.ActionTemplateID
	--WHERE t.ActionTemplateID is null	
	
	DELETE FROM dbo.BIS2_MT_HV_ACTION_TEMPLATE_SEGMENT WHERE ActionTemplateID = @ActionTemplateID
	
	DECLARE curAction CURSOR FOR
			SELECT ActionGenerationID FROM BIS2_MT_HV_ACTION_GENERATION WHERE ActionTemplateID = @ActionTemplateID;
			
			OPEN curAction;
			FETCH NEXT FROM curAction INTO @ActionGenerationID;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					Update dbo.BIS2_MT_HV_TASK 
					Set Status = 'Unassigned'
					WHERE ActionGenerationID = @ActionGenerationID AND Not Status = 'Closed'					
				FETCH NEXT FROM curAction INTO @ActionGenerationID;
				END;
			CLOSE curAction;
			DEALLOCATE curAction;



GO
ALTER TABLE [dbo].[VE_HV_ACTION_FACTORY_TEMPLATE] ENABLE TRIGGER [trg_BIS2_Template_Delete]
GO
