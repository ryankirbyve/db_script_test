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




CREATE VIEW [dbo].[VE_VW_HV_MosaicHost]
AS
--=====================================================================================================
-- The following Intellectual Property Notice applies to all software code below and replaces any
-- similar notice contained in this software.
-- Intellectual Property Notice
-- 
-- Copyright (c) 2013 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
-- The BIS2 software code below is a component of BIS2's gameViz(tm) software solution (which may include,
-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq. 
-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
-- End User License Agreement.
--=====================================================================================================
-- Author: Tonya Talbot
-- Date: 11/28/2016
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--=====================================================================================================
WITH Tasks_Completed
AS (
	SELECT
		--DISTINCT 
		CAST(CompletionDate AS DATE) AS CompletionDate
		,HostID
		,PlayerID
		,1 AS Completed_Tasks
	FROM VE_HV_Task
	WHERE CompletionDate IS NOT NULL
	GROUP BY CompletionDate
		,HostID
		,PlayerID
	)
	,Tasks_CompletedAgg
AS (
	SELECT CompletionDate
		,HostId
		,PlayerID
		,COUNT(Completed_Tasks) AS Completed_Tasks
	FROM Tasks_Completed
	GROUP BY CompletionDate
		,HostId
		,PlayerID
	)
	,Tasks_Due
AS (
	SELECT HOSTID
		,COUNT(CASE 
				WHEN CompletionDate IS NULL
					AND DueDate >= current_timestamp
					AND StartFromDate <= Current_timestamp
					THEN 1
				ELSE NULL
				END) AS TDue
	FROM VE_HV_Task
	GROUP BY HostID
	)
	,COMMS
AS (
	SELECT HostID
		,PlayerID
		,CreateDate
		,1 AS CommCount
	FROM VE_HV_COMMUNICATION
	)
	,COMMS_Agg
AS (
	SELECT DISTINCT CreateDate
		,HostID
		,PlayerID
		,SUM(CommCount) AS CommDaily
		,1 AS Unique_Comms
	FROM Comms
	GROUP BY CreateDate
		,HostID
		,PlayerID
	)
SELECT
	--*
	1 AS CorpLevel
	,ISNULL(Comms_Agg.HostID, Tasks_CompletedAgg.HostID) AS HostID
	,ISNULL(Comms_Agg.PlayerId, Tasks_CompletedAgg.PlayerID) AS PlayerID
	,ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate) AS InteractionDate
	,ISNULL(CommDaily, 0) AS CommTotal
	,ISNULL(Unique_Comms, 0) AS CommUnique
	,ISNULL(Completed_Tasks, 0) AS TasksCompleted
	,ISNULL(TDUE, 0) AS TasksDue
	,RIGHT(CAST(DATEPART(yy, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR), 4) AS YearLabel
	,'Q' + CAST(DATEPART(qq, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR) AS QuarterLabel
	,LEFT(CAST(DATENAME(mm, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR), 3) AS MonthLabel
	,CAST(DATEPART(dd, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR) AS DayofMonthLabel
	,CAST(DATEPART(WEEK, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR) AS WeekofYearLabel
	,CAST(DATENAME(dw, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR) AS DayofWeekLabel
	,CASE 
		WHEN ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate) <= DATEADD(yy, - 1, Getdate())
			AND ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate) >= DATEADD(month, DATEDIFF(month, 0, Dateadd(yy
						, - 1, Getdate())), 0)
			THEN 1
		ELSE 0
		END AS PYMTDFlag
	,CASE 
		WHEN ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate) <= DATEADD(yy, - 1, Getdate())
			AND ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate) >= DATEADD(qq, DATEDIFF(qq, 0, Dateadd(yy, - 1, 
						Getdate())), 0)
			THEN 1
		ELSE 0
		END AS PYQTDFlag

FROM Comms_Agg
FULL OUTER JOIN Tasks_CompletedAgg
	ON Tasks_CompletedAgg.HostId = Comms_Agg.HostId
		AND Tasks_CompletedAgg.CompletionDate = Comms_agg.CreateDate
		AND Tasks_CompletedAgg.PlayerId = Comms_agg.PlayerID
LEFT JOIN Tasks_Due
	ON Tasks_Due.HostID = Comms_Agg.HostID



GO
