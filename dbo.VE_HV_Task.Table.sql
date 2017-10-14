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
CREATE TABLE [dbo].[VE_HV_Task](
	[TaskID] [varchar](36) NOT NULL,
	[HostID] [varchar](36) NULL,
	[PlayerID] [int] NOT NULL,
	[ActionGenerationID] [varchar](36) NULL,
	[Type] [varchar](20) NULL,
	[Name] [varchar](25) NULL,
	[Description] [varchar](4000) NULL,
	[DueDate] [datetime] NULL,
	[StartFromDate] [datetime] NULL,
	[ActualStartDate] [datetime] NULL,
	[CompletionDate] [datetime] NULL,
	[Notes] [varchar](4000) NULL,
	[Priority] [smallint] NULL,
	[Status] [varchar](15) NULL,
	[DissolveDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[VersionNum] [int] NULL,
	[IsAutoTask] [int] NULL,
 CONSTRAINT [PK__BIS2_HV___7C6949D10E614135] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [NCLX_CompletionDate_Status_DissolveDate] ON [dbo].[VE_HV_Task]
(
	[CompletionDate] ASC,
	[Status] ASC,
	[DissolveDate] ASC
)
INCLUDE ( 	[HostID],
	[Priority]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VE_HV_Task] ADD  CONSTRAINT [DF__BIS2_HV_T__Statu__173876EA]  DEFAULT ('unactioned') FOR [Status]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[BIS2_TRG_HV_TASK_aUPSERT] ON [dbo].[VE_HV_Task]
AFTER UPDATE
	,INSERT
AS
BEGIN
	UPDATE VE_HV_Task
	SET [CompletionDate] = GETDATE()
	FROM VE_HV_Task t
	LEFT JOIN deleted d
		ON t.TaskID = d.TaskID
	LEFT JOIN inserted i
		ON t.TaskID = i.TaskID
	WHERE COALESCE(d.STATUS, 'unassigned') <> 'Closed'
		AND i.STATUS = 'Closed';

	--UPDATE BIS2_HV_TASK
	--SET [DissolveDate] = i.DissolveDate
	--FROM BIS2_HV_TASK t
	--LEFT JOIN deleted d
	--	ON t.TaskID = d.TaskID
	--LEFT JOIN inserted i
	--	ON t.TaskID = i.TaskID
	--WHERE i.DissolveDate IS NULL;
END;
GO
ALTER TABLE [dbo].[VE_HV_Task] ENABLE TRIGGER [BIS2_TRG_HV_TASK_aUPSERT]
GO
