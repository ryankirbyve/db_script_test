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
CREATE VIEW [dbo].[VE_VW_HV_PlayerSession] AS
SELECT
	PlayerID
	, mnum
	, SiteID
	, DATEADD(mm,-6,EndTime) EndTime
	, DATEADD(mm,-6,StartTime) StartTime
	, TimePlayed
	, Location
	, CoinIn
	, CoinOut
	, Games
	, Jackpot
	, BillsIn
	, AverageBet
	, Win
	, TheoWin
	, CompEarned
	, Type
	, XC_Used
	, PointsEarned
	, PointMultiplier
	, DATEADD(mm,-6,AccountingDate) AccountingDate
FROM
	HostViz_IGT_Template.dbo.VE_T_PlayerSession_CurrentOnFloor_Demo
UNION ALL
SELECT  
	PlayerID
	, mnum
	, SiteID
	, EndTime
	, StartTime
	, TimePlayed
	, Location
	, CoinIn
	, CoinOut
	, Games
	, Jackpot
	, BillsIn
	, AverageBet
	, Win
	, TheoWin
	, CompEarned
	, Type
	, XC_Used
	, PointsEarned
	, PointMultiplier
	, AccountingDate
FROM
	HostViz_IGT_Template.dbo.VE_T_PlayerSession_CurrentOnFloor_Demo;
GO
