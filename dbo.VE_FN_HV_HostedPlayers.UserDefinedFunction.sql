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
CREATE FUNCTION [dbo].[VE_FN_HV_HostedPlayers] (
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
	-- 2016-06-21		2.0				Ryan Kirby			Materialized LastTrip
	-- 2016-09-14        3.0             Added dates         Jocelyn Alcala
	--=====================================================================================================
RETURNS TABLE
AS
RETURN
--DECLARE @ENDDATE DATE = Current_timestamp;
WITH Dates AS(
		SELECT 1 AS Hack
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP), 0)) AS TP_StartDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) + 1, 0)) AS TP_EndDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) - 1, 0)) AS LP_StartDate
			,convert(DATE, DATEADD(q, -1, CURRENT_TIMESTAMP)) AS LP_EndDate
		)
	/*,Hosts AS (
		SELECT VE_VW_HV_Host.HostID
			,VE_VW_HV_Host.LoginName
			,VE_VW_HV_Host.HostName
			,1 AS PlayerCount
		FROM VE_VW_HV_Host
		)*/
	,Players AS (
		SELECT VE_VW_HV_PlayerHost.PlayerID
			,VE_VW_HV_PlayerHost.HostID
			,VE_VW_HV_Player.Age
			,VE_VW_HV_Player.Gender
			,VE_VW_HV_Player.Birthday
			,VE_VW_HV_Player.BirthMonth
			,VE_VW_HV_Player.DateEnrolled
			,VE_VW_HV_PlayerDetail.FirstName AS PlayerFirst
			,VE_VW_HV_PlayerDetail.LastName AS PlayerLast
			,VE_VW_HV_HostedPlayerRank.[Description] AS Tier
			,VE_VW_HV_PlayerDetail.PostalMailOptIn
			,VE_VW_HV_PlayerDetail.PhoneOptIn
			,VE_VW_HV_PlayerDetail.Phone
			,VE_VW_HV_PlayerDetail.Email
			,VE_VW_HV_PlayerDetail.Line1 AS StreetAddress
			,VE_VW_HV_PlayerDetail.City
			,VE_VW_HV_PlayerDetail.STATE
			,VE_VW_HV_PlayerDetail.ZipCode
		FROM VE_VW_HV_PlayerHost
		INNER JOIN VE_VW_HV_PlayerDetail
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_PlayerDetail.PlayerID
		INNER JOIN VE_VW_HV_Player
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_Player.PlayerID
		LEFT JOIN VE_VW_HV_HostedPlayerRank
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_HostedPlayerRank.PlayerID
		)
	,ThisPeriod AS (
		SELECT 
			VE_VW_HV_PlayerHost.PlayerID
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed / 3600.00) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.TP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.TP_EndDate
		GROUP BY VE_VW_HV_PlayerHost.PlayerID
		)
	,LastPeriod AS (
		SELECT VE_VW_HV_PlayerHost.PlayerID
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed / 3600.00) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.LP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.LP_EndDate
		GROUP BY VE_VW_HV_PlayerHost.PlayerID
		)
	,Tasks AS (
		SELECT VE_HV_TASK.PlayerID
			,COUNT(DISTINCT VE_HV_TASK.TaskID) AS TasksAssigned
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Open'
						THEN 1
					ELSE NULL
					END) AS OpenTasks
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Unactioned'
						THEN 1
					ELSE NULL
					END) AS UnactionedTasks
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Closed'
						THEN 1
					ELSE NULL
					END) AS CompletedTasks
		FROM VE_HV_TASK
		GROUP BY VE_HV_TASK.PlayerID
		)
	,Comms AS (
		SELECT VE_HV_COMMUNICATION.PlayerID
			,COUNT(DISTINCT VE_HV_COMMUNICATION.PlayerID) AS CommsUnique
			,COUNT(DISTINCT VE_HV_COMMUNICATION.CommunicationID) AS CommsTotal
		FROM VE_HV_COMMUNICATION
		GROUP BY VE_HV_COMMUNICATION.PlayerID
		)
	,LastTrip AS (
		SELECT PlayerID
			,LastTrip
			,TripsOwed
			,DaysSinceLastTrip
		FROM VE_VW_HV_LastTrip
		)

SELECT Hosts.HostID
	,Players.PlayerID
	,Hosts.LoginName
	,Hosts.HostName
	,1 AS Player_Count
	,Players.PlayerFirst
	,Players.PlayerLast
	,Players.Age
	,Players.Gender
	,Players.Birthday
	,Players.DateEnrolled
	,Players.Tier
	,Players.PostalMailOptIn
	,Players.PhoneOptIn
	,Players.BirthMonth
	,Players.Phone
	,Players.Email
	,Players.StreetAddress
	,Players.City
	,Players.STATE
	,Players.ZipCode
	,ThisPeriod.ADT AS TP_ADT
	,ThisPeriod.ADA AS TP_ADA
	,ThisPeriod.TheoWin AS TP_TheoWin
	,ThisPeriod.ActualWin AS TP_ActualWin
	,ThisPeriod.Visits AS TP_Visits
	,ThisPeriod.HoursPlayed AS TP_HoursPlayed
	,LastPeriod.ADT AS LP_ADT
	,LastPeriod.ADA AS LP_ADA
	,LastPeriod.TheoWin AS LP_TheoWin
	,LastPeriod.ActualWin AS LP_ActualWin
	,LastPeriod.Visits AS LP_Visits
	,LastPeriod.HoursPlayed AS LP_HoursPlayed
	,COALESCE(ThisPeriod.ADT, 0) - COALESCE(LastPeriod.ADT, 0) AS Var_ADT
	,COALESCE(ThisPeriod.ADA, 0) - COALESCE(LastPeriod.ADA, 0) AS Var_ADA
	,COALESCE(ThisPeriod.TheoWin, 0) - COALESCE(LastPeriod.TheoWin, 0) AS Var_TheoWin
	,COALESCE(ThisPeriod.ActualWin, 0) - COALESCE(LastPeriod.ActualWin, 0) AS Var_ActualWin
	,COALESCE(ThisPeriod.Visits, 0) - COALESCE(LastPeriod.Visits, 0) AS Var_Visits
	,COALESCE(ThisPeriod.HoursPlayed, 0) - COALESCE(LastPeriod.HoursPlayed, 0) AS Var_HoursPlayed
	,Comms.CommsTotal --total
	,Comms.CommsUnique --unique
	,Tasks.TasksAssigned --total
	,Tasks.OpenTasks --open
	,Tasks.UnactionedTasks --unactioned
	--,Tasks.OverallContacts
	--,Tasks.UniquePlayers
	,Tasks.CompletedTasks --complete
	,LastTrip.LastTrip
	,LastTrip.TripsOwed
	,LastTrip.DaysSinceLastTrip
FROM Players
LEFT JOIN VE_VW_HV_Host Hosts
	ON Players.HostID = Hosts.HostID
LEFT JOIN ThisPeriod
	ON Players.PlayerID = ThisPeriod.PlayerID
LEFT JOIN LastPeriod
	ON Players.PlayerID = LastPeriod.PlayerID
LEFT JOIN Comms
	ON Players.PlayerID = Comms.PlayerID
LEFT JOIN Tasks
	ON Players.PlayerID = Tasks.PlayerID
LEFT HASH JOIN LastTrip
	ON Players.PlayerID = LastTrip.PlayerID
GO
