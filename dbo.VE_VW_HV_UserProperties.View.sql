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



/*	*
	* INTELLECTUAL PROPERTY NOTICE
	* Copyright (C) 2008 - 2016 NEW BIS SAFE LUXCO S.A.R.L
	*
	* The VizExplorer software code below is a component of a VizExplorer software solution.
	*
	* If the software code below is in non-source code executable form, then the code is
	* licensed to you on the terms and conditions of VizExplorer’s standard End User License
	* Agreement, a copy of which is located on VizExplorer’s website
	* at: http://www.vizexplorer.com/license-agreements/. By using the software code you
	* agree that you have read and accepted the terms and conditions of VizExplorer’s standard
	* End User License Agreement.
	*
	* If the software code below is in source code form, no license or other permission is
	* granted to you to use the software code.
	*
==========================================================================================
	Date		Vers.	Name				Comments
	2017-09-29	1.0		Initial Version		
========================================================================================== */
CREATE VIEW [dbo].[VE_VW_HV_UserProperties] AS
SELECT
	  [_ID]
	, [_Version]
	, [UserID]
	, [IndividualEmail]
	, [IsAvailableForTasks]
	, [LoginStatus]
	, [IsPreferredLogin]
	, [MapToUserID]
	, [UserPhone]
	, [UserGroupID]
	, [ParentKey]
	, [DefaultValue]
	, [LookupName]
	, [SiteID]
	, [IsUncoded]
FROM [GreetViz_template].[dbo].[VE_gv_UserProperties] WITH (NOLOCK)


GO
