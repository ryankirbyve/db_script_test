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
CREATE VIEW [dbo].[VE_VW_HV_Preference_HV02]
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
-- Date: 16 March 2016
-- Version: 1.0
-- Notes: Created to allow preferences to be grouped by their Parent Key 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--20160630		1.0					Ryan Kirby			Initial commit
--=====================================================================================================

SELECT t1.PreferenceID
	,t1.PlayerID
	,t1.PreferenceTypeID
	,t1.PreferenceDetail
	,t1.CreateDate
	,t2.LookupValue AS Master_Type
	,t3.LookupValue AS Sub_Type
FROM (
	SELECT PreferenceID
		,PlayerID
		,PreferenceTypeID
		,PreferenceDetail
		,CreateDate
		,VE_HV_DROPDOWNVALUES.ParentKey
	FROM Hostviz_IGT_Template.dbo.VE_HV_PREFERENCE
	INNER JOIN VE_HV_DROPDOWNVALUES
		ON VE_HV_PREFERENCE.PreferenceTypeID = VE_HV_DROPDOWNVALUES.LookUpKey
	) AS T1
INNER JOIN (
	SELECT LookupValue
		,LookupKey
	FROM VE_HV_DROPDOWNVALUES
	WHERE PArentKey IS NULL
		OR parentkey LIKE ''
	) AS T2
	ON T1.ParentKey = T2.LookupKey
INNER JOIN (
	SELECT LookupValue
		,LookupKey
	FROM VE_HV_DROPDOWNVALUES
	WHERE LookupName LIKE 'Preferences'
	) AS T3
	ON T1.PreferenceTypeID = T3.LookupKey







;
GO
