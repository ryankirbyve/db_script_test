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
CREATE TABLE [dbo].[VE_HV_LastTrip](
	[PlayerID] [int] NOT NULL,
	[LastTrip] [date] NULL,
	[TripsOwed] [decimal](38, 12) NULL,
	[DaysSinceLastTrip] [int] NULL
) ON [PRIMARY]
GO
