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
CREATE TABLE [dbo].[VE_HV_ACTION_GENERATION](
	[ActionGenerationID] [varchar](36) NOT NULL,
	[ActionTemplateID] [varchar](36) NULL,
	[UsernameLastModified] [varchar](25) NULL,
	[GenerateType] [varchar](15) NULL,
	[GenerateSubType] [varchar](20) NULL,
	[Description] [varchar](120) NULL,
	[Priority] [smallint] NULL,
	[StartFromDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[AssignHostBehavior] [varchar](12) NULL,
	[AssignHostBehaviorOverflow] [varchar](12) NULL,
	[HostIDAssign] [varchar](36) NULL,
	[HostIDAssignOverflow] [varchar](36) NULL,
	[TriggerEventType] [varchar](15) NULL,
	[TriggerEventSubType] [varchar](20) NULL,
	[SegmentID] [varchar](36) NULL,
	[SegmentName] [varchar](30) NULL,
	[SegmentType] [varchar](15) NULL,
	[SourceActionReason] [varchar](30) NULL,
	[CreateDate] [datetime] NULL,
	[VersionNum] [int] NULL,
	[Name] [varchar](25) NULL
) ON [PRIMARY]
GO
