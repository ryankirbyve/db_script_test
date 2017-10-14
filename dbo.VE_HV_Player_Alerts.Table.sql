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
CREATE TABLE [dbo].[VE_HV_Player_Alerts](
	[_ID] [varchar](36) NOT NULL,
	[_Version] [int] NOT NULL,
	[Description] [varchar](256) NULL,
	[PlayerID] [int] NOT NULL,
	[CreateDtm] [datetime] NULL,
	[Status] [int] NOT NULL,
	[HostID] [varchar](36) NOT NULL,
	[SiteID] [int] NOT NULL,
 CONSTRAINT [PK_VE_HV_Player_Alerts] PRIMARY KEY CLUSTERED 
(
	[_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VE_HV_Player_Alerts] ADD  CONSTRAINT [DF_VE_HV_Player_Alerts$_ID]  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_HV_Player_Alerts] ADD  CONSTRAINT [DF_VE_HV_Player_Alerts$_Version]  DEFAULT ((0)) FOR [_Version]
GO
ALTER TABLE [dbo].[VE_HV_Player_Alerts] ADD  CONSTRAINT [DF_VE_HV_Player_Alerts$CreateDtm]  DEFAULT (getdate()) FOR [CreateDtm]
GO
ALTER TABLE [dbo].[VE_HV_Player_Alerts] ADD  CONSTRAINT [DF_VE_HV_Player_Alerts$Status]  DEFAULT ((0)) FOR [Status]
GO
