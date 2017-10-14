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
-- Author: Tonya Talbot
-- Date: 20161117
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--2016-11-17      1.0               Tonya Talbot             Initial Version
--=====================================================================================================
CREATE VIEW [dbo].[VE_VW_HV_MosaicPlayer]
AS
SELECT VE_VW_HV_PlayerHost.PlayerID
	--,CAST(VE_VW_HV_PlayerHost.PlayerID AS VARCHAR) AS PlayerIDVar  /*attempted to make a varchar version to get rid of commas*/
	,HostID
	,Accountingdate
	,1 AS CorpLevel
	,VE_VW_HV_DailyPlayer.SiteID
	,TheoWin AS TheoWin
	,Win AS ActualWin
	,CompEarned
	,-1*Freeplay as Freeplay
	,Jackpot
	,1 AS Visits
	,RIGHT(CAST(DATEPART(yy, Accountingdate) AS VARCHAR), 2) AS YearLabel
	,'Q' + CAST(DATEPART(qq, Accountingdate) AS VARCHAR) AS QuarterLabel
	,'Q' + CAST(DATEPART(qq, Accountingdate) AS VARCHAR) +' '+RIGHT(CAST(DATEPART(yy, Accountingdate) AS VARCHAR), 2) AS QuarterYearLabel
	,LEFT(CAST(DATENAME(mm, Accountingdate) AS VARCHAR), 3) AS MonthLabel
	,LEFT(CAST(DATENAME(mm, Accountingdate) AS VARCHAR), 3) +' '+RIGHT(CAST(DATEPART(yy, Accountingdate) AS VARCHAR), 2) AS MonthYearLabel
	,CAST(DATEPART(dd, Accountingdate) AS VARCHAR) AS DayofMonthLabel
	,CAST(DATEPART(week,AccountingDate) AS VARCHAR) AS WeekofYearLabel
	,CAST(DATEPART(DAYOFYEAR,AccountingDate) AS VARCHAR) AS DayofYearLabel
	,CAST(DATENAME(dw,AccountingDate) AS VARCHAR) AS DayofWeekLabel
	,CASE 
		WHEN AccountingDate <= DATEADD(yy, - 1, Getdate())
			AND accountingDate >= DATEADD(month, DATEDIFF(month, 0, Dateadd(yy, - 1, Getdate())), 0)
			THEN 1
		ELSE 0
		END AS PYMTDFlag
	,CASE 
		WHEN AccountingDate <= DATEADD(yy, - 1, Getdate())
			AND accountingDate >= DATEADD(qq, DATEDIFF(qq, 0, Dateadd(yy, - 1, Getdate())), 0)
			THEN 1
		ELSE 0
		END AS PYQTDFlag
	,CASE 
		WHEN AccountingDate <= DATEADD(yy, - 1, Getdate())
			AND accountingDate >= DATEADD(year, DATEDIFF(year, 0, Dateadd(yy, - 1, Getdate())), 0)
			THEN 1
		ELSE 0
		END AS PYTDFlag
FROM VE_VW_HV_DailyPlayer
INNER JOIN VE_VW_HV_PlayerHost
	ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
WHERE VE_VW_HV_DailyPlayer.AccountingDate >=DATEADD(YEAR, DATEDIFF(YEAR, 0,DATEADD(YEAR, -1, GETDATE())), 0) --beginning of Last Year
	AND VE_VW_HV_DailyPlayer.AccountingDate <= CURRENT_TIMESTAMP --Needed in the Demo but not necessary in a customer database









GO
