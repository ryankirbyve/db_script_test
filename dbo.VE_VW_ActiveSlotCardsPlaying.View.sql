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






CREATE VIEW [dbo].[VE_VW_ActiveSlotCardsPlaying]
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
-- Author: David John Shepherd
-- Date: 12 February 2016
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
--=====================================================================================================
SELECT isnull(cardout.PlayerID, cardin.PlayerID) AS PlayerID
	,CASE 
		WHEN isnull(cardout.EventTime, '1993-01-01 00:00:00') > isnull(cardin.EventTime, '1993-01-01 00:00:00')
			THEN cardout.EventTime
		ELSE cardin.EventTime
		END AS EVENTTIME
	--,isnull(cardout.EventTime, cardin.EventTime) AS EventTime
	,CASE 
		WHEN isnull(cardout.EventTime, '1993-01-01 00:00:00') > isnull(cardin.EventTime, '1993-01-01 00:00:00')
			THEN cardout.Location
		ELSE cardin.Location
		END AS Location
	,
	--,isnull(cardout.Location, cardin.Location) AS Location
	CASE 
		WHEN isnull(cardout.EventTime, '1993-01-01 00:00:00') > isnull(cardin.EventTime, '1993-01-01 00:00:00 ')
			THEN cardout.IsCardOut
		ELSE cardin.IsCardOut
		END AS IsCardOut
	,
	--,isnull(cardout.IsCardOut, cardin.IsCardOut) AS IscardOut
	CASE 
		WHEN isnull(cardout.EventTime, '1993-01-01 00:00:00 ') > isnull(cardin.EventTime, '1993-01-01 000:00:00 ')
			THEN cardout.cardid
		ELSE cardin.cardid
		END AS cardid
--,isnull(cardout.cardid, cardin.cardid) AS cardid
--,CASE 
--	WHEN isnull(cardout.EventTime, '1993-01-01 00:00:00') > isnull(cardin.EventTime, '1993-01-01 00:00:00')
--		THEN cardout.eventcode
--	ELSE cardin.eventcode
--	END AS eventcode
--,isnull(cardout.eventcode, cardin.eventcode) AS eventcode
FROM (
	SELECT *
	FROM (
		SELECT ci.location
			,ci.insertdate AS eventtime
			,PlayerCard.playerid
			,'CardOut' AS iscardout
			,ci.cardid
			,ROW_NUMBER() OVER (
				PARTITION BY PlayerCard.playerid ORDER BY ci.insertdate DESC
				) AS ranking
		FROM HostViz_IGT_Patron.dbo.cardin ci
		INNER JOIN HostViz_IGT_Patron.dbo.PlayerCard ON ci.cardid = PlayerCard.cardid
		WHERE ci.Completed = 'y'
			AND insertdate > dateadd(mi, - 30, getdatE())
		) f
	WHERE ranking = 1
	) AS CardOut
FULL OUTER JOIN (
	SELECT location
		,playerid
		,insertdate AS eventtime
		,'CardIn' AS Iscardout
		,cardid
	FROM (
		SELECT ci.location
			,event.playerid
			,ci.insertdate
			,ci.cardid
			,ROW_NUMBER() OVER (
				PARTITION BY event.playerid ORDER BY ci.insertdate DESC
				) AS ranking
		FROM HostViz_IGT_Patron.dbo.cardin ci
		INNER JOIN HostViz_IGT_Accounting.dbo.event ON ci.cardid = event.cardid
		WHERE ci.NoLongerActiveCardIn = 0
			AND ci.completed = 'n'
		) t
	WHERE ranking = 1
	) CardIn ON Cardout.playerid = cardin.playerid
--ORDER BY location DESC





GO
