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


/*	*
	* INTELLECTUAL PROPERTY NOTICE
	* Copyright (C) 2008 - 2016 NEW BIS SAFE LUXCO S.A.R.L
	*
	* The VizExplorer software code below is a component of a VizExplorer software solution.
	*
	* If the software code below is in non-source code executable form, then the code is
	* licensed to you on the terms and conditions of VizExplorer’s standard End User License
	* Agreement, a copy of which is located on VizExplorer’s website
	* at: http://www.vizexplorer.com/license-agreements/. By using the software code you
	* agree that you have read and accepted the terms and conditions of VizExplorer’s standard
	* End User License Agreement.
	*
	* If the software code below is in source code form, no license or other permission is
	* granted to you to use the software code.
	*
==========================================================================================
	Date		Vers.	Name				Comments
	2016-11-01	1.0		Kate Skobeleva		Initial version
	2017-02-28	1.1		Alexey Maksimov		Minor changes
	2017-03-10	1.2		Alexey Maksimov		Unified field names, SiteID
	2017-06-07	1.3		Nick Rehagen		Add todays trip metrics seperate from last trip 
	2016-07-13	1.4		Alexey Maksimov		Today_Trip_Win => Today_Trip_Worth,
											Last_Trip_Win => Last_Trip_Worth
	2017-07-26	1.5		Ryan Kirby			Added tw90, aw90, & placeholders for gamepref,
												,compbal, compused, & RI
========================================================================================== */
CREATE VIEW [dbo].[VE_VW_HV_PlayerMetrics]
AS
SELECT statLast.PlayerID AS PatronID
	,1 AS SiteID
	,stat365.ADT AS ADT365
	,stat365.ADA AS ADA365
	,stat365.ADW AS ADW365
	,stat90.ADT AS ADT90
	,stat90.ADA AS ADA90
	,stat90.ADW AS ADW90
	,stat90.TheoWin as TheoWin90
	,stat90.win as win90
	,statLast.Accountingdate AS LastTripDate
	,statLast.Last_Trip_Actual AS LastTripActual
	,statLast.Last_Trip_Theo AS LastTripTheo
	,statLast.Last_Trip_Worth AS LastTripWorth
	,statToday.Accountingdate AS TodayTripDate
	,statToday.Today_Trip_Actual AS TodayTripActual
	,statToday.Today_Trip_Theo AS TodayTripTheo
	,statToday.Today_Trip_Worth AS TodayTripWorth
	,'S' as GamePreference
	,0.00 as CompBalance
	,0.00 as CompUsed
	,0.00 as Reinvestment
FROM (
	SELECT a.PlayerID
		,a.Accountingdate
		,sum(b.win) AS [Last_Trip_Actual]
		,sum(b.TheoWin) AS [Last_Trip_Theo]
		,(
			CASE 
				WHEN SUM(b.TheoWin) > (
						SELECT Value1
						FROM VE_VW_HV_ApplicationPreferences
						WHERE NAME = 'viz_ADWConstant'
						) * SUM(b.win)
					THEN SUM(b.TheoWin)
				ELSE (
						SELECT Value1
						FROM VE_VW_HV_ApplicationPreferences
						WHERE NAME = 'viz_ADWConstant'
						) * SUM(b.win)
				END
			) AS [Last_Trip_Worth]
	FROM (
		SELECT PlayerID
			,Max(Accountingdate) AS Accountingdate
		FROM [dbo].[VE_VW_HV_DailyPlayer] WITH (NOLOCK)
		WHERE AccountingDate <= CAST(Current_timestamp AS DATE)
		GROUP BY PlayerID
		) a
	JOIN [dbo].[VE_VW_HV_DailyPlayer] b WITH (NOLOCK)
		ON a.PlayerID = b.PlayerID
			AND a.Accountingdate = b.Accountingdate
	WHERE b.win <> 0
		OR b.TheoWin <> 0
	GROUP BY a.PlayerID
		,a.Accountingdate
	) statLast
LEFT JOIN (
	SELECT [dbo].[VE_VW_HV_DailyPlayer].PlayerID
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
			ELSE 0
			END AS ADT
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (sum([dbo].[VE_VW_HV_DailyPlayer].win) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate))
			ELSE 0
			END AS ADA
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (
						CASE 
							WHEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) > (
									SELECT Value1
									FROM VE_VW_HV_ApplicationPreferences
									WHERE NAME = 'viz_ADWConstant'
									) * (SUM([dbo].[VE_VW_HV_DailyPlayer].win))
								THEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
							ELSE (
									SELECT Value1
									FROM VE_VW_HV_ApplicationPreferences
									WHERE NAME = 'viz_ADWConstant'
									) * (SUM([dbo].[VE_VW_HV_DailyPlayer].win)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
							END
						)
			ELSE 0
			END AS ADW
	FROM [dbo].[VE_VW_HV_DailyPlayer] WITH (NOLOCK)
	WHERE AccountingDate >= cast(DATEADD(dd, - 364, Getdate()) AS DATE)
	GROUP BY [dbo].[VE_VW_HV_DailyPlayer].PlayerID
	) stat365
	ON statLast.PlayerID = stat365.PlayerID
LEFT JOIN (
	SELECT [dbo].[VE_VW_HV_DailyPlayer].PlayerID
		,SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin) as TheoWin
		,SUM([dbo].[VE_VW_HV_DailyPlayer].win) as win
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
			ELSE 0
			END AS ADT
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (sum([dbo].[VE_VW_HV_DailyPlayer].win) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate))
			ELSE 0
			END AS ADA
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (
						CASE 
							WHEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) > (
									SELECT Value1
									FROM VE_VW_HV_ApplicationPreferences
									WHERE NAME = 'viz_ADWConstant'
									) * (SUM([dbo].[VE_VW_HV_DailyPlayer].win))
								THEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
							ELSE (
									SELECT Value1
									FROM VE_VW_HV_ApplicationPreferences
									WHERE NAME = 'viz_ADWConstant'
									) * (SUM([dbo].[VE_VW_HV_DailyPlayer].win)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
							END
						)
			ELSE 0
			END AS ADW
	FROM [dbo].[VE_VW_HV_DailyPlayer] WITH (NOLOCK)
	WHERE AccountingDate >= cast(DATEADD(dd, - 89, Getdate()) AS DATE)
	GROUP BY [dbo].[VE_VW_HV_DailyPlayer].PlayerID
	) stat90
	ON statLast.PlayerID = stat90.PlayerID
LEFT JOIN (
	SELECT a.PlayerID
		,a.Accountingdate
		,sum(b.win) AS [Today_Trip_Actual]
		,sum(b.TheoWin) AS [Today_Trip_Theo]
		,(
			CASE 
				WHEN SUM(b.TheoWin) > (
						SELECT Value1
						FROM VE_VW_HV_ApplicationPreferences
						WHERE NAME = 'viz_ADWConstant'
						) * SUM(b.win)
					THEN SUM(b.TheoWin)
				ELSE (
						SELECT Value1
						FROM VE_VW_HV_ApplicationPreferences
						WHERE NAME = 'viz_ADWConstant'
						) * SUM(b.win)
				END
			) AS [Today_Trip_Worth]
	FROM (
		SELECT PlayerID
			,Max(Accountingdate) AS Accountingdate
		FROM [dbo].[VE_VW_HV_DailyPlayer] WITH (NOLOCK)
		WHERE AccountingDate >= CAST(Current_timestamp AS DATE)
		GROUP BY PlayerID
		) a
	JOIN [dbo].[VE_VW_HV_DailyPlayer] b WITH (NOLOCK)
		ON a.PlayerID = b.PlayerID
			AND a.Accountingdate = b.Accountingdate
	WHERE b.win <> 0
		OR b.TheoWin <> 0
	GROUP BY a.PlayerID
		,a.Accountingdate
	) statToday
	ON statLast.PlayerID = statToday.PlayerID

GO
