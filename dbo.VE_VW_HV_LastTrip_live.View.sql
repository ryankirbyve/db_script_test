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
-- Author: Ryan Kirby
-- Date: 2016-06-21
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2016-06-21		1.0				Ryan Kirby				Initial commit.
--=====================================================================================================
CREATE VIEW [dbo].[VE_VW_HV_LastTrip_live]
AS
(
		SELECT PH.PlayerID
			,MAX(CAST(VE_VW_HV_DailyPlayer.AccountingDate AS DATE)) AS LastTrip
			,CASE 
				WHEN CASE 
						WHEN COUNT(DISTINCT VE_VW_HV_DailyPlayer.AccountingDate) - 1 <> 0
							THEN DATEDIFF(dd, min(VE_VW_HV_DailyPlayer.AccountingDate), MAX(VE_VW_HV_DailyPlayer.AccountingDate)) / CAST((COUNT(DISTINCT VE_VW_HV_DailyPlayer.AccountingDate)) - 1 AS DECIMAL(15, 2))
						ELSE 0
						END <> 0
					THEN DATEDIFF(dd, MAX(VE_VW_HV_DailyPlayer.AccountingDate), MAX(CURRENT_TIMESTAMP)) / CASE 
							WHEN COUNT(DISTINCT VE_VW_HV_DailyPlayer.AccountingDate) - 1 <> 0
								THEN DATEDIFF(dd, MIN(VE_VW_HV_DailyPlayer.AccountingDate), MAX(VE_VW_HV_DailyPlayer.AccountingDate)) / CAST((COUNT(DISTINCT VE_VW_HV_DailyPlayer.AccountingDate)) - 1 AS DECIMAL(15, 2))
							ELSE 0
							END
				ELSE 0
				END AS TripsOwed
			,datediff(dd, max(VE_VW_HV_DailyPlayer.AccountingDate), MAX(CURRENT_TIMESTAMP)) AS DaysSinceLastTrip
		FROM VE_VW_HV_DailyPlayer
		INNER JOIN VE_VW_HV_PlayerHost PH ON PH.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.Accountingdate <= CURRENT_TIMESTAMP
		GROUP BY PH.PlayerID
		)

GO
