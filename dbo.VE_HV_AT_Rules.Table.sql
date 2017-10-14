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
CREATE TABLE [dbo].[VE_HV_AT_Rules](
	[Rules_Version] [int] NULL,
	[Rules_PK] [varchar](40) NULL,
	[Rules_Task_ID] [varchar](40) NULL,
	[Metric] [varchar](10) NULL,
	[Metric_Min] [decimal](10, 2) NULL,
	[Metric_Max] [decimal](10, 2) NULL,
	[Time_Period] [decimal](10, 2) NULL,
	[Dim_IN] [varchar](50) NULL
) ON [PRIMARY]
GO
