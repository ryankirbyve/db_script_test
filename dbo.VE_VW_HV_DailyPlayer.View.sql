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

--=====================================================================================================
-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
-- similar notice contained in this sofTheoWinare.
-- Intellectual Property Notice
-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
-- End User License Agreement.
--=====================================================================================================
-- Author: Jeffrey Mihalik
-- Date: December 7th, 2014
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--2014-12-07      1.0               Jeffrey Mihalik             Initial Version
--2014-12-08      1.1               Christopher West            Added Hackjoin 
--=====================================================================================================
CREATE VIEW [dbo].[VE_VW_HV_DailyPlayer]
AS
SELECT 1 AS HackJoin
	,PlayerID
	,SiteID
	,AccountingDate
	--Type,
	,[Slot_TimePlayed] + [Table_TimePlayed] AS TimePlayed
	,[Slot_CoinIn] + [Table_ChipsIn] AS CoinIn
	,[Slot_CoinOut] + [Table_ChipsOut] AS CoinOut
	,[Slot_Games] + [Table_Games] AS Games
	,[Slot_Jackpot] AS Jackpot
	,[Slot_CoinIn] - [Slot_CoinOut] + [Table_Win] AS Win
	,[Slot_TheoWin] + [Table_TheoWin] AS TheoWin
	,[Slot_CompEarned] + [Table_CompEarned] as CompEarned
	,[Slot_XC_Used] AS FreePlay
	,[Slot_XC_PPEarned] AS PointPlay
	,[Slot_XC_BSEarned] AS BonusPlay
	,[Slot_BillsIn] AS BillsIn
	,[Slot_TheoWin] + [Table_TheoWin] - [Slot_XC_Used] AS NetTheoWin
	,[Slot_CoinIn] - [Slot_CoinOut] + [Table_Win] - [Slot_XC_Used] AS NetActualWin
FROM [HostViz_IGT_Patron].[dbo].[PlayerDay]
	--FROM	HostViz_IGT_Template.dbo.BIS2_Daily_Player
GO
