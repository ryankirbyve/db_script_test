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

CREATE VIEW [dbo].[VE_VW_HV_Current_Players_On_Floor]
AS
----=====================================================================================================
---- The following Intellectual Property Notice applies to all software code below and replaces any
---- similar notice contained in this software.
---- Intellectual Property Notice
---- 
---- Copyright (c) 2013 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
---- The BIS2 software code below is a component of BIS2's gameViz(tm) software solution (which may include,
---- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
---- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
---- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq. 
---- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
---- End User License Agreement.
----=====================================================================================================
---- Author: David John Shepherd
---- Date: 12 February 2016
---- Version: 1.0
---- Notes: 
----=====================================================================================================
----  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
----=====================================================================================================
----2016-08-05     1.0               Nick Rehagen					Inital Version-Rewriting VE_VW_Current_Player_OnFloor
----2016-12-30     2.0				Tonya Talbot			Rewritten for performance and readability
----=====================================================================================================

--Should contain a list of Players with card in or a card out event in the last 2 hours, along with dimensions related to these players
WITH Players
AS (
	SELECT AP.PlayerID
		,PD.FirstName
		,PD.LastName
		,Host.HostName
		,AP.location
		,AP.IsCardOut
		,PR.Description AS Tier--Card Tier
	FROM VE_VW_ActiveTablePlay AP
	INNER JOIN VE_VW_HV_PlayerDetail PD --Make sure this playerDetail includes unhosted Players
		ON PD.PlayerId = AP.PlayerID
	LEFT JOIN VE_VW_HV_PlayerHost PH
		ON PH.PlayerID = AP.PlayerID --Left join because we allow unhosted
	LEFT JOIN VE_VW_HV_Host AS host ON host.HostID = PH.HostID
	LEFT JOIN VE_VW_HV_HostedPlayerRank PR
		ON PR.PlayerID = AP.PlayerID
	WHERE AP.EventTime >= DATEADD(mi, - 120, getdate())
	)
	,Communication
AS (
	SELECT PlayerID
		,HostID AS LastContactedBy
		,CreateDate AS LastContact
		,DATEDIFF(dd,CreateDate,getdate()) AS DaysSinceCommunication
	FROM (
		SELECT PlayerID
			,HostID
			,CreateDate
			,Row_Number() OVER (
				PARTITION BY VE_HV_Communication.PlayerID ORDER BY CreateDate DESC
				) AS RN
		FROM VE_HV_Communication
		) Comm_RN
	WHERE RN = 1
	)
	,CurrentQuarterPlay
AS (
	SELECT playerday.PlayerID AS PlayerID
		,SUM(([CoinIn] - [CoinOut])) AS CQActual
		,count(DISTINCT AccountingDate) AS CQVisits
		,SUM(TheoWin) AS CQTheo
	FROM HostViz_IGT_Template.dbo.VE_VW_HV_PlayerSession playerday
	WHERE AccountingDate >= convert(DATE, DATEADD(q, DATEDIFF(q, 0, getdate()), 0))
		AND AccountingDate < convert(DATE, DATEADD(q, DATEDIFF(q, 0, getdate()) + 1, 0))
	GROUP BY playerday.PlayerID
	)
	,TodaysPlay
AS (
	SELECT PlayerID AS PlayerID
		,SUM(TheoWin) AS TodaysTheo
		,((sum([CoinIn]) - sum([CoinOut])) /*- sum([Slot_Jackpot])*/) AS TodaysWin
	FROM HostViz_IGT_Template.dbo.VE_VW_HV_PlayerSession playerday
	WHERE (CAST(AccountingDate AS DATE) = CAST(getdate() AS DATE))
		AND EndTime <= getdate()
	GROUP BY PlayerID
	)
SELECT Players.PlayerID
	,Players.HostName
	,TodaysPlay.TodaysTheo
	,1 AS Siteid
	,Players.Location AS Mnum
	,Players.Location
	,Players.Tier
	,Players.IsCardOut
	,TodaysPlay.TodaysWin
	,Communication.LastcontactedBy AS LastContactBy
	,CASE 
		WHEN TodaysPlay.TodaysTheo > 250
			AND Communication.DaysSinceCommunication > 1
			THEN 'Yes'
		WHEN TodaysPlay.TodaysTheo > 250
			AND Communication.DaysSinceCommunication IS NULL
			THEN 'Yes'
		ELSE 'No'
		END AS Hot
	,CASE 
		WHEN Players.HostName IS NULL
			THEN 'No'
		ELSE 'Yes'
		END AS Hosted
	,Communication.DaysSinceCommunication AS DaysSinceCommunication
	,Communication.Lastcontact AS LastContacted
	,CurrentQuarterPlay.CQActual
	,CurrentQuarterPlay.CQTheo
	,CurrentQuarterPlay.CQVisits
FROM Players
LEFT JOIN Communication ON Communication.PlayerID = Players.PlayerID
LEFT JOIN TodaysPlay ON TodaysPlay.PlayerID = Players.PlayerID 
LEFT JOIN CurrentQuarterPlay ON CurrentQuarterPlay.PlayerID = Players.PlayerID;
GO
