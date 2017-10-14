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
CREATE TABLE [dbo].[VE_HV_AutoTaskGeneration](
	[_ID] [varchar](36) NOT NULL,
	[Version] [int] NULL,
	[Enabled] [varchar](3) NULL,
	[AutomationType] [varchar](30) NULL,
	[RuleName] [varchar](25) NULL,
	[TaskName] [varchar](256) NULL,
	[TaskDescription] [varchar](50) NULL,
	[TaskType] [varchar](20) NULL,
	[StartDateDeviation] [int] NULL,
	[DueDateDeviation] [int] NULL,
	[DissolveDateDeviation] [int] NULL,
	[TaskPriority] [int] NULL,
	[SiteID] [int] NULL,
	[AssignHostBehavior] [varchar](12) NULL,
	[Specific_HostID] [varchar](20) NULL,
	[Flex_Period] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VE_HV_AutoTaskGeneration] ADD  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_HV_AutoTaskGeneration] ADD  DEFAULT ((0)) FOR [Version]
GO
