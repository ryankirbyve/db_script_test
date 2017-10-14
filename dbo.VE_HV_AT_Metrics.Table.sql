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
CREATE TABLE [dbo].[VE_HV_AT_Metrics](
	[_ID] [varchar](50) NULL,
	[VersionNum] [int] NULL,
	[Metric] [varchar](30) NULL,
	[Metric_Fragment] [varchar](250) NULL
) ON [PRIMARY]
GO
