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
CREATE TABLE [dbo].[VE_T_PlayerSession_CurrentOnFloor_Demo](
	[PlayerID] [int] NOT NULL,
	[mnum] [int] NOT NULL,
	[SiteID] [smallint] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[TimePlayed] [int] NULL,
	[Location] [varchar](25) NULL,
	[CoinIn] [decimal](18, 2) NULL,
	[CoinOut] [decimal](18, 2) NULL,
	[Games] [int] NULL,
	[Jackpot] [decimal](18, 2) NULL,
	[BillsIn] [decimal](18, 2) NULL,
	[AverageBet] [decimal](18, 4) NULL,
	[Win] [decimal](18, 4) NULL,
	[TheoWin] [decimal](18, 4) NULL,
	[CompEarned] [decimal](18, 4) NULL,
	[Type] [char](1) NULL,
	[XC_Used] [decimal](18, 2) NULL,
	[PointsEarned] [decimal](18, 4) NULL,
	[PointMultiplier] [varchar](50) NULL,
	[AccountingDate] [date] NULL
) ON [PRIMARY]
GO
