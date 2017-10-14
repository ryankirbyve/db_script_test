﻿/*    ==Scripting Parameters==

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




CREATE VIEW [dbo].[VE_VW_ActiveTablePlay]
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
-- Date: 22 April 2016
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
--=====================================================================================================
SELECT isnull(tcardout.PlayerID, tcardin.PlayerID) AS PlayerID
	,CASE 
		WHEN isnull(tcardout.EventTime, '1993-01-01 00:00:00') > isnull(tcardin.EventTime, '1993-01-01 00:00:00')
			THEN tcardout.EventTime
		ELSE tcardin.EventTime
		END AS EVENTTIME
	--,isnull(tcardout.EventTime, tcardin.EventTime) AS EventTime
	,CASE 
		WHEN isnull(tcardout.EventTime, '1993-01-01 00:00:00') > isnull(tcardin.EventTime, '1993-01-01 00:00:00')
			THEN tcardout.Location
		ELSE tcardin.Location
		END AS Location
	--,isnull(tcardout.Location, tcardin.Location) AS Location
	,CASE 
		WHEN isnull(tcardout.EventTime, '1993-01-01 00:00:00') > isnull(tcardin.EventTime, '1993-01-01 00:00:00')
			THEN tcardout.IsCardOut
		ELSE tcardin.IsCardOut
		END AS IsCardOut
--,isnull(tcardout.IsCardOut, tcardin.IsCardOut) AS IscardOut
FROM (
	SELECT EventTime
		,PlayerID
		,Location
		,Iscardout
	FROM (
		SELECT dateadd(hh, - 4, timein) AS EventTime
			,HostViz_IGT_Patron.dbo.patron.patronID AS PlayerID
			,HostViz_IGT_Patron.dbo.location.NAME AS location
			,CASE 
				WHEN Timeout IS NULL
					THEN 'CardIn'
				ELSE 'CardOut'
				END AS isCardOut
			,rank() OVER (
				PARTITION BY HostViz_IGT_Patron.dbo.[Rating].Accountid ORDER BY timein DESC
				) AS rank
		FROM HostViz_IGT_Patron.dbo.[Rating]
		INNER JOIN HostViz_IGT_Patron.dbo.location ON HostViz_IGT_Patron.dbo.[Rating].locationID = HostViz_IGT_Patron.dbo.location.LocationId
		INNER JOIN HostViz_IGT_Patron.dbo.patron ON HostViz_IGT_Patron.dbo.[Rating].accountid = HostViz_IGT_Patron.dbo.patron.accountid
		WHERE timein >= DATEADD(mi, - 30, GETUTCDATE())
			--AND tablemanager.tms.patron.rankid IS NOT NULL
		) t1
	WHERE rank = 1
		AND Iscardout = 'CardOut'
	) tcardout
FULL OUTER JOIN (
	SELECT EventTime
		,PlayerID
		,Location
		,Iscardout
	FROM (
		SELECT dateadd(hh, - 4, timein) AS EventTime
			,HostViz_IGT_Patron.dbo.patron.patronID AS PlayerID
			,HostViz_IGT_Patron.dbo.location.NAME AS location
			,CASE 
				WHEN Timeout IS NULL
					THEN 'CardIn'
				ELSE 'CardOut'
				END AS isCardOut
			,rank() OVER (
				PARTITION BY HostViz_IGT_Patron.dbo.[Rating].Accountid ORDER BY timein DESC
				) AS rank
		FROM HostViz_IGT_Patron.dbo.[Rating]
		INNER JOIN HostViz_IGT_Patron.dbo.location ON HostViz_IGT_Patron.dbo.[Rating].locationID = HostViz_IGT_Patron.dbo.location.LocationId
		INNER JOIN HostViz_IGT_Patron.dbo.patron ON HostViz_IGT_Patron.dbo.[Rating].accountid = HostViz_IGT_Patron.dbo.patron.accountid
		WHERE timein >= DATEADD(hh, - 24, GETUTCDATE())
			--AND tablemanager.tms.patron.rankid IS NOT NULL
		) t2
	WHERE rank = 1
		AND Iscardout = 'Cardin'
	) tcardin ON tcardout.playerid = tcardin.playerid



GO
