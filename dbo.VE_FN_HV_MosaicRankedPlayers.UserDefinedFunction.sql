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
CREATE FUNCTION [dbo].[VE_FN_HV_MosaicRankedPlayers] (
	@StartDate DATE
	,@EndDate DATE
	)
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
	-- Author: Cory Clanin
	-- Date: December 30, 2015
	-- Version: 1.0
	-- Notes: 
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
	
	--=====================================================================================================
RETURNS TABLE
AS
RETURN
--DECLARE @ENDDATE DATE = Current_timestamp;

WITH Metrics AS (
SELECT
VE_VW_HV_DailyPlayer.PlayerID
,HostID
,VE_VW_HV_DailyPlayer.SiteID
,SUM(Theowin) AS TheoWin
,SUM(Win) AS ActualWin
,-1.0*SUM(Win) AS PlayerWin
,SUM(Games) AS GamesPlayed
,SUM(Jackpot) AS Jackpot
,SUM(VE_VW_HV_DailyPlayer.FreePlay) AS Freeplay
,COUNT (DISTINCT CAST(VE_VW_HV_DailyPlayer.PlayerID AS varchar) + CAST(Accountingdate AS Varchar)) AS Visits
,CASE WHEN COUNT (DISTINCT CAST(VE_VW_HV_DailyPlayer.PlayerID AS varchar) + CAST(Accountingdate AS Varchar)) <> 0
	THEN SUM(TheoWin) / COUNT (DISTINCT CAST(VE_VW_HV_DailyPlayer.PlayerID AS varchar) + CAST(Accountingdate AS Varchar))
	ELSE 0
	END AS ADT
,CASE WHEN COUNT (DISTINCT CAST(VE_VW_HV_DailyPlayer.PlayerID AS varchar) + CAST(Accountingdate AS Varchar))<> 0
	THEN SUM(Win) / COUNT (DISTINCT CAST(VE_VW_HV_DailyPlayer.PlayerID AS varchar) + CAST(Accountingdate AS Varchar))
	ELSE 0
	END AS ADA
FROM VE_VW_HV_DailyPlayer
INNER JOIN VE_VW_HV_PlayerHost
	ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
WHERE VE_VW_HV_DailyPlayer.AccountingDate >= @StartDate
	AND VE_VW_HV_DailyPlayer.AccountingDate <= @EndDate
GROUP BY VE_VW_HV_DailyPlayer.PlayerID,HostID,VE_VW_HV_DailyPlayer.SiteID
)

SELECT
PlayerId
,1 AS CorpLevel
,@StartDate AS Norm
,HostID
,siteID
,GamesPlayed
,Jackpot
,Freeplay
,TheoWin
,Visits
,Row_Number() OVER ( ORDER BY TheoWin DESC) AS TheoWinRanking
,ActualWin
,Row_Number() OVER ( ORDER BY ActualWin DESC) AS ActualWinRank
,PlayerWin
,Row_Number() OVER ( ORDER BY PlayerWin DESC) AS PlayerWinRank
,ADT
,Row_Number() OVER ( ORDER BY ADT DESC) AS ADTRank
,ADA
,Row_Number() OVER ( ORDER BY ADA DESC) AS ADARank
FROM Metrics
GO
