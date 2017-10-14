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
CREATE FUNCTION [dbo].[VE_FN_HV_HostManagerSummary] (
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
	-- Date: January 4, 2016
	-- Version: 1.0
	-- Notes: 
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
	-- 2016-06-21		2.0				Ryan Kirby			-- Removed unnecessary joins for performance
	--														-- Commented out playergroup stuff from joins for performance
	--														-- Fixed variance calculations
	-- 2017-01-03		2.1				Tonya Talbot		--Added Case when to all divisions
	--=====================================================================================================
RETURNS TABLE
AS
RETURN
WITH Dates AS(
		SELECT 1 AS Hack
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP), 0)) AS TP_StartDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) + 1, 0)) AS TP_EndDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) - 1, 0)) AS LP_StartDate
			,convert(DATE, DATEADD(q, -1, CURRENT_TIMESTAMP)) AS LP_EndDate
		)
	,Hosts AS (
		SELECT @StartDate AS Norm
			,COUNT(DISTINCT VE_VW_HV_Host.HostID) AS HostCount
			,COUNT(DISTINCT VE_VW_HV_PlayerHost.PlayerID) AS PlayerCount
		FROM VE_VW_HV_Host
		LEFT JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_Host.hostid = VE_VW_HV_PlayerHost.hostid
		)
	,ThisPeriod AS (
		-- This Period
		SELECT COUNT(DISTINCT VE_VW_HV_DailyPlayer.PlayerID) AS PlayerCount
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
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
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed / 3600.0) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.TP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.TP_EndDate
		)
	,LastPeriod AS (
		-- Last Period
		SELECT COUNT(DISTINCT VE_VW_HV_DailyPlayer.PlayerID) AS PlayerCount
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
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
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed / 3600.0) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.LP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.LP_EndDate

		)
	,Tasks AS (
		SELECT COUNT(VE_HV_TASK.TaskID) AS TasksAssigned
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Open' AND HostID IS NOT NULL
						THEN VE_HV_TASK.TaskID 
					ELSE NULL
					END) AS TasksOpen
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Unactioned' AND HostID IS NOT NULL
						THEN VE_HV_TASK.TaskID
					ELSE NULL
					END) AS TasksUnactioned
			
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Closed' AND HostID IS NOT NULL
						THEN VE_HV_TASK.TaskID
					ELSE NULL
					END) AS TasksCompleted
		FROM VE_HV_TASK
		)
	,Comms AS(
	SELECT COUNT(DISTINCT VE_HV_COMMUNICATION.CommunicationID) AS OverallContacts
		,COUNT(DISTINCT VE_HV_COMMUNICATION.PlayerID) AS UniquePlayers
		,COUNT(DISTINCT VE_HV_COMMUNICATION.CommunicationID) AS CommsLoggedTotal
		,COUNT(DISTINCT VE_HV_COMMUNICATION.PlayerID) AS CommsLoggedUnique
	FROM VE_HV_COMMUNICATION
		)

SELECT Hosts.HostCount
	,Hosts.PlayerCount
	,Hosts.Norm
	,ThisPeriod.PlayerCount AS NumberOfPlayersThisPeriod
	,CASE WHEN cast(Hosts.PlayerCount AS DECIMAL) <> 0
		THEN cast(ThisPeriod.PlayerCount AS DECIMAL) / cast(Hosts.PlayerCount AS DECIMAL)
		ELSE 0
		END AS PercentOfHostedPlayersThisPeriod
	--Maintenance
	,NULL AS PG1_TheoWin
	,NULL AS PG1_ActualWin
	,NULL AS PG1_ADT
	,NULL AS PG1_Visits
	,NULL AS PG1_HoursPlayed
	,NULL AS PG1_ADA
	--Inactive
	,NULL AS PG2_TheoWin
	,NULL AS PG2_ActualWin
	,NULL AS PG2_ADT
	,NULL AS PG2_Visits
	,NULL AS PG2_HoursPlayed
	,NULL AS PG2_ADA
	--New Play
	,NULL AS PG3_TheoWin
	,NULL AS PG3_ActualWin
	,NULL AS PG3_ADT
	,NULL AS PG3_Visits
	,NULL AS PG3_HoursPlayed
	,NULL AS PG3_ADA
	--Gold
	,NULL AS PG4_TheoWin
	,NULL AS PG4_ActualWin
	,NULL AS PG4_ADT
	,NULL AS PG4_Visits
	,NULL AS PG4_HoursPlayed
	,NULL AS PG4_ADA
	--Platinum
	,NULL AS PG5_TheoWin
	,NULL AS PG5_ActualWin
	,NULL AS PG5_ADT
	,NULL AS PG5_Visits
	,NULL AS PG5_HoursPlayed
	,NULL AS PG5_ADA
	--This Period
	,COALESCE(ThisPeriod.TheoWin, 0) AS TP_TheoWin
	,COALESCE(ThisPeriod.ActualWin, 0) AS TP_ActualWin
	,COALESCE(ThisPeriod.ADT, 0) AS TP_ADT
	,COALESCE(ThisPeriod.Visits, 0) AS TP_Visits
	,COALESCE(ThisPeriod.HoursPlayed, 0) AS TP_HoursPlayed
	,COALESCE(ThisPeriod.ADA, 0) AS TP_ADA
	--Last Period
	,COALESCE(LastPeriod.TheoWin, 0) AS LP_TheoWin
	,COALESCE(LastPeriod.ActualWin, 0) AS LP_ActualWin
	,COALESCE(LastPeriod.ADT, 0) AS LP_ADT
	,COALESCE(LastPeriod.Visits, 0) AS LP_Visits
	,COALESCE(LastPeriod.HoursPlayed, 0) AS LP_HoursPlayed
	,COALESCE(LastPeriod.ADA, 0) AS LP_ADA
	--Variance
	,COALESCE(ThisPeriod.TheoWin, 0) - COALESCE(LastPeriod.TheoWin, 0) AS V_TheoWin
	,COALESCE(ThisPeriod.ActualWin, 0) - COALESCE(LastPeriod.ActualWin, 0) AS V_ActualWin
	,COALESCE(ThisPeriod.ADT, 0) - COALESCE(LastPeriod.ADT, 0) AS V_ADT
	,COALESCE(ThisPeriod.Visits, 0) - COALESCE(LastPeriod.Visits, 0) AS V_Visits
	,COALESCE(ThisPeriod.HoursPlayed, 0) - COALESCE(LastPeriod.HoursPlayed, 0) AS V_HoursPlayed
	,COALESCE(ThisPeriod.ADA, 0) - COALESCE(LastPeriod.ADA, 0) AS V_ADA
	,Tasks.TasksAssigned
	,Tasks.TasksOpen
	,Tasks.TasksUnactioned
	,Tasks.TasksCompleted
	,Comms.OverallContacts
	,Comms.UniquePlayers
	,Comms.CommsLoggedTotal
	,Comms.CommsLoggedUnique
FROM Hosts
LEFT JOIN Tasks
	ON 1 = 1
LEFT JOIN Comms
	ON 1 = 1
LEFT JOIN ThisPeriod
	ON 1 = 1
LEFT JOIN LastPeriod
	ON 1 = 1
GO
