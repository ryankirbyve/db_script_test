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
CREATE TABLE [dbo].[zzVE_HV_AT_Task_Template](
	[HostID] [int] NULL,
	[NAME] [varchar](35) NULL,
	[description] [varchar](50) NULL,
	[Start_From_Date] [date] NULL,
	[Due_Date] [date] NULL,
	[Host_Assignment] [varchar](25) NULL,
	[Dissolve_Date] [date] NULL,
	[Create_Date] [date] NULL,
	[TMP_Version] [int] NULL,
	[Scheduler] [int] NULL,
	[Template_Task_ID] [varchar](50) NULL
) ON [PRIMARY]
GO
