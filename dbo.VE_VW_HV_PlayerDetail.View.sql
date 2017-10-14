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




CREATE VIEW [dbo].[VE_VW_HV_PlayerDetail]
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
-- Author: Terence Trezevant
-- Date: 24 October 2013
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
-- 02 Nov 2013  1.0  Irina    Comment IN statement 
-- 03 Mar 2014  1.1  Komkrit Yensirikul  Remove "IsPreferredName = 0"
-- 6/18/2014        1.2    Bryan Skellett/Julian Woodhouse     Remove SiteID restriction 
-- 20 Aug 2014  1.3  Judy Schroeder   Remove commas
-- 2016-02-22	1.4		Ryan Kirby		Removed Age Band
--=====================================================================================================
SELECT p.PlayerID
	,pn.FirstName
	,pn.LastName
	,p.SiteID
	,p.STATUS
	,p.BirthDay
	,CASE 
		WHEN DATEADD(YEAR, DATEDIFF(YEAR, p.Birthday, CURRENT_TIMESTAMP), p.Birthday) > CURRENT_TIMESTAMP
			THEN DATEDIFF(YEAR, p.Birthday, CURRENT_TIMESTAMP) - 1
		ELSE DATEDIFF(YEAR, p.Birthday, CURRENT_TIMESTAMP)
		END AS Age
	,DATENAME(MM, p.Birthday) AS BirthMonth
	,p.DateEnrolled
	,p.Gender
	,pa.Line1
	,pa.Zipcode
	,pa.City
	,pa.STATE
	,pp.Phone
	,pp.Preferred
	,pp.AllowMessages
	,pe.Email
	,pe.DefaultEmail
	,d.PostalMailOptIn
	,d.EmailOptIn
	,d.TextMessagingOptIn
	,d.PhoneOptIn
	,case 
	   when p.Status='X'  Then 'Y'
	 else 'N' End as IsBanned
FROM [HostViz_IGT_Patron].[dbo].[Player] AS p WITH (NOLOCK)
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerAddress] AS pa WITH (NOLOCK)
	ON pa.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerPhone] AS pp WITH (NOLOCK)
	ON pp.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerEmail] AS pe WITH (NOLOCK)
	ON pe.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerName] AS pn WITH (NOLOCK)
	ON pn.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[DirectMarketingPlayerConfig] AS d WITH (NOLOCK)
	ON d.playerid = p.playerid



GO
