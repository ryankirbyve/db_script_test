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
CREATE FUNCTION [dbo].[VE_FN_HV_HostIDLookup] (@loginNameVar VARCHAR(50))
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
	-- Date: 2016-03-22
	-- Version: 1.0
	-- Notes: Looks up hostID given a loginname, and allows users the ability to masquerade as other users
	--			in active directory setups.
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
	-- 2016-03-22		1.0					Ryan Kirby			Initial commit.
	--=====================================================================================================
RETURNS TABLE
AS
RETURN
WITH masquerade AS (
		SELECT '99999' AS HostID
			,'vendorbiz2' AS LoginName
		
		UNION ALL
		
		SELECT '0' AS HostID
			,'hostmanager' AS LoginName
		)
	,main_lookup AS (
		SELECT HostID
			,LoginName
		FROM VE_VW_HV_Host
		WHERE HostID NOT IN (
				SELECT DISTINCT HostID
				FROM masquerade
				)
		UNION ALL
		SELECT HostID
			,LoginName
		FROM
			masquerade
		)

SELECT HostID
FROM main_lookup
WHERE UPPER(LoginName) = UPPER(@loginNameVar);
GO
