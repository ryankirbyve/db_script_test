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
CREATE TABLE [dbo].[VE_HV_HostList](
	[VIPid] [varchar](36) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[VersionNum] [int] NOT NULL,
	[Department] [varchar](36) NOT NULL,
	[HostID] [int] NOT NULL,
	[QuarterlyNetTheoGoal] [decimal](18, 2) NULL,
	[QNTG_DollarOverRide] [decimal](18, 2) NULL,
	[GoalRating] [varchar](25) NULL,
	[QNTG_GoalValue] [decimal](18, 2) NULL,
	[HostName] [varchar](50) NULL,
	[overallcontactgoal] [decimal](18, 2) NULL,
	[uniquecontactgoal] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[VIPid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT (newid()) FOR [VIPid]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ('1970-01-01') FOR [StartDate]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ('2100-01-01') FOR [EndDate]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ((1)) FOR [VersionNum]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ('VIP') FOR [Department]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ((1)) FOR [HostID]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ('A5') FOR [GoalRating]
GO
