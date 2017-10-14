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
CREATE FUNCTION [dbo].[VE_FN_HV_Hosts] (
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
	-- Author: Ryan Kirby
	-- Date: 2016-02-23
	-- Version: 1.0
	-- Notes: 
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
    --04/25/2015		1.0					Jocelyn Alcala			Added Prior Year Quarter
	--=====================================================================================================
RETURNS TABLE
AS
RETURN

--DECLARE @EndDate date = '20160418';
WITH Dates AS(
		SELECT 1 AS Hack
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP), 0)) AS TP_StartDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) + 1, 0)) AS TP_EndDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) - 1, 0)) AS LP_StartDate
			,convert(DATE, DATEADD(q, -1, CURRENT_TIMESTAMP)) AS LP_EndDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, @EndDate) - 4, 0)) AS PQTD_StartDate
			,convert(DATE, DATEADD(q, -3, @EndDate)) AS PQTD_EndDate
		)
	,Hosts AS (
		SELECT VE_VW_HV_Host.HostID
		,VE_VW_HV_Host.HostName
		,VE_VW_HV_Host.LoginName AS LoginName
		,VE_VW_HV_Host.SiteID
		--,VE_VW_HV_Host.SiteCode
	FROM VE_VW_HV_Host
	GROUP BY VE_VW_HV_Host.HostID
		,VE_VW_HV_Host.HostName
		,VE_VW_HV_Host.LoginName
		,VE_VW_HV_Host.SiteID
		--,VE_VW_HV_Host.SiteCode
		)
	,PlayerCount
	AS (
	SELECT ph.hostid
		,COUNT(DISTINCT ph.PlayerID) AS PlayerCount
	FROM VE_VW_HV_PlayerHost AS ph
	GROUP BY ph.hostid
	)
	,ThisPeriod AS (
		SELECT VE_VW_HV_PlayerHost.HostID
			--,VE_VW_HV_DailyPlayer.PlayerID
			
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
			--,COUNT(DISTINCT VE_VW_HV_DailyPlayer.AccountingDate) AS Visits
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.TP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.TP_EndDate
		GROUP BY 
		--VE_VW_HV_DailyPlayer.PlayerID,
			VE_VW_HV_PlayerHost.HostID
		)
	,LastPeriod AS (
		SELECT VE_VW_HV_PlayerHost.HostID
			--,VE_VW_HV_DailyPlayer.PlayerID
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
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.LP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.LP_EndDate
		GROUP BY 
		--VE_VW_HV_DailyPlayer.PlayerID,
			VE_VW_HV_PlayerHost.HostID
		)

	,PriorYearQTD AS (
		--Prior Year Quarter
		SELECT VE_VW_HV_PlayerHost.HostID
			--,VE_VW_HV_DailyPlayer.PlayerID
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
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.PQTD_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.PQTD_EndDate
		GROUP BY 
		--VE_VW_HV_DailyPlayer.PlayerID,
			VE_VW_HV_PlayerHost.HostID
		)
	,Tasks
AS (
	SELECT VE_HV_HostList.HostID
		,COUNT(DISTINCT VE_HV_TASK.TaskID) AS TasksAssigned
		,SUM(CASE 
				WHEN VE_HV_TASK.STATUS = 'Open'
					THEN 1
				ELSE 0
				END) AS TasksOpen
		,SUM(CASE 
				WHEN VE_HV_TASK.STATUS = 'Unactioned'
					THEN 1
				ELSE 0
				END) AS TasksUnactioned
		,SUM(CASE 
				WHEN VE_HV_TASK.STATUS = 'Closed'
					THEN 1
				ELSE 0
				END) AS TasksCompleted
	FROM VE_HV_HostList
	LEFT JOIN VE_HV_TASK ON VE_HV_TASK.HostID = VE_HV_HostList.HostID
	GROUP BY VE_HV_HostList.HostID
	)
	,Comms
AS (
	SELECT VE_VW_HV_PlayerHost.HostID
		,COUNT(DISTINCT VE_HV_COMMUNICATION.CommunicationID) AS OverallContacts
		,COUNT(DISTINCT VE_HV_COMMUNICATION.PlayerID) AS UniquePlayers
	FROM VE_VW_HV_PlayerHost
	INNER JOIN VE_HV_COMMUNICATION ON VE_VW_HV_PlayerHost.PlayerID = VE_HV_COMMUNICATION.PlayerID
	GROUP BY VE_VW_HV_PlayerHost.HostID
	)

SELECT Hosts.HostID
	,Hosts.LoginName
	,Hosts.HostName
	,PlayerCount.PlayerCount AS Player_Count
	--This Period
	,ThisPeriod.ADT AS TP_ADT
	,ThisPeriod.ADA AS TP_ADA
	,ThisPeriod.TheoWin AS TP_TheoWin
	,ThisPeriod.ActualWin AS TP_ActualWin
	,ThisPeriod.Visits AS TP_Visits
	,ThisPeriod.HoursPlayed AS TP_HoursPlayed
	--Last Period
	,LastPeriod.ADT AS LP_ADT
	,LastPeriod.ADA AS LP_ADA
	,LastPeriod.TheoWin AS LP_TheoWin
	,LastPeriod.ActualWin AS LP_ActualWin
	,LastPeriod.Visits AS LP_Visits
	,LastPeriod.HoursPlayed AS LP_HoursPlayed
	--Prior Year Quarter
	,COALESCE(PriorYearQTD.TheoWin, 0) AS PYQTD_TheoWin
	,COALESCE(PriorYearQTD.ActualWin, 0) AS PYQTD_ActualWin
	,COALESCE(PriorYearQTD.ADT, 0) AS PYQTD_ADT
	,COALESCE(PriorYearQTD.Visits, 0) AS PYQTD_Visits
	,COALESCE(PriorYearQTD.HoursPlayed, 0) AS PYQTD_HoursPlayed
	,COALESCE(PriorYearQTD.ADA, 0) AS PYQTD_ADA
	-- Variance
	,COALESCE(ThisPeriod.ADT, 0) - COALESCE(LastPeriod.ADT, 0) AS Var_ADT
	,COALESCE(ThisPeriod.ADA, 0) - COALESCE(LastPeriod.ADA, 0) AS Var_ADA
	,COALESCE(ThisPeriod.TheoWin, 0) - COALESCE(LastPeriod.TheoWin, 0) AS Var_TheoWin
	,COALESCE(ThisPeriod.ActualWin, 0) - COALESCE(LastPeriod.ActualWin, 0) AS Var_ActualWin
	,COALESCE(ThisPeriod.Visits, 0) - COALESCE(LastPeriod.Visits, 0) AS Var_Visits
	,COALESCE(ThisPeriod.HoursPlayed, 0) - COALESCE(LastPeriod.HoursPlayed, 0) AS Var_HoursPlayed
	,Comms.OverallContacts as CommsTotal --total
	,Comms.UniquePlayers as CommsUnique --unique
	,Tasks.TasksAssigned --total
	,Tasks.TasksOpen as OpenTasks --open
	,Tasks.TasksUnactioned as UnactionedTasks --unactioned
	,Comms.OverallContacts
	,Comms.UniquePlayers
	,Tasks.TasksCompleted as CompletedTasks --complete
	--,Hosts.SiteID
	--,Hosts.SiteCode
FROM Hosts
LEFT JOIN PlayerCount
	ON Hosts.HostID = PlayerCount.hostid
LEFT JOIN ThisPeriod
	ON Hosts.HostID = ThisPeriod.HostID
LEFT JOIN LastPeriod
	ON Hosts.HostID = LastPeriod.HostID
	LEFT JOIN PriorYearQTD
	ON Hosts.HostID = PriorYearQTD.HostID
LEFT JOIN Comms
	ON Hosts.HostID = Comms.HostID
LEFT JOIN Tasks
	ON Hosts.HostID = Tasks.HostID
GO
