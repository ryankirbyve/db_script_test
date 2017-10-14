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
CREATE TABLE [dbo].[Playerday](
	[PlayerId] [int] NOT NULL,
	[SiteID] [smallint] NOT NULL,
	[TripNumber] [int] NOT NULL,
	[AccountingDate] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Slot_Sessions] [int] NOT NULL,
	[Slot_TimePlayed] [int] NOT NULL,
	[Slot_CoinIn] [money] NOT NULL,
	[Slot_CoinOut] [money] NOT NULL,
	[Slot_Games] [int] NOT NULL,
	[Slot_Jackpot] [money] NOT NULL,
	[Slot_BillsIn] [money] NOT NULL,
	[Slot_TheoWin] [money] NOT NULL,
	[Slot_CompEarned] [money] NOT NULL,
	[Slot_PointsEarned] [int] NOT NULL,
	[Slot_XC_Used] [money] NOT NULL,
	[Slot_XC_RPEarned] [money] NOT NULL,
	[Slot_XC_PPEarned] [money] NOT NULL,
	[Slot_XC_BSEarned] [money] NOT NULL,
	[Slot_RP_PointAdjustment] [int] NOT NULL,
	[Slot_RP_EarnedDay] [int] NOT NULL,
	[Slot_PointsUsed] [int] NOT NULL,
	[Slot_CompUsed] [money] NOT NULL,
	[Table_Sessions] [int] NOT NULL,
	[Table_ChipsIn] [money] NOT NULL,
	[Table_ChipsOut] [money] NOT NULL,
	[Table_Games] [int] NOT NULL,
	[Table_PointsEarned] [int] NOT NULL,
	[Table_TheoWin] [money] NOT NULL,
	[Table_CompEarned] [money] NOT NULL,
	[Table_TimePlayed] [int] NOT NULL,
	[Table_AmtWagered] [money] NOT NULL,
	[Table_Win] [money] NOT NULL,
	[Table_CashBuyIn] [money] NOT NULL,
	[Table_NonCashBuyIn] [money] NOT NULL,
	[Table_PointsUsed] [int] NOT NULL,
	[Table_CompUsed] [money] NOT NULL,
	[Archived] [bit] NOT NULL
) ON [PRIMARY]
GO
