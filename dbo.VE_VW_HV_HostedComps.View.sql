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
-- Date: 2016-01-12
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 
--=====================================================================================================
CREATE VIEW [dbo].[VE_VW_HV_HostedComps]
AS
SELECT h.hostID
	,h.hostID as UserID
	,c.IssuedTo AS PlayerID
	,ct.Description AS TypeDescription
	,cl.Description AS Description
	,CASE 
		WHEN c.TypeID <> 1
			THEN 'Yes'
		ELSE 'No'
		END AS HostIssued
	,cl.STATUS AS STATUS
	,c.IssueDate AS IssueDate
	,ca.SlotValue + ca.TableValue AS CompUsed
	,c.AccountingDate AS RedeemedDate
	,CAST(c.DollarValue AS INT) AS DollarValue
	,c.UserID AS ComporID
FROM HostViz_IGT_Patron.dbo.Comp AS c WITH (NOLOCK) 
LEFT JOIN HostViz_IGT_Template.dbo.VE_VW_HV_Host AS h WITH (NOLOCK) 
	ON c.UserID = h.HostID
LEFT JOIN HostViz_IGT_Patron.dbo.CompList AS cl WITH (NOLOCK) 
	ON c.ItemNumber = cl.ItemNumber
LEFT JOIN HostViz_IGT_Patron.dbo.CompAllocation AS ca WITH (NOLOCK) 
	ON c.CompID = ca.CompID
LEFT JOIN HostViz_IGT_Patron.dbo.CompType AS ct WITH (NOLOCK) 
	ON c.TypeID = ct.TypeID
WHERE c.IssueDate >= DATEADD(mm, - 3, CURRENT_TIMESTAMP)
	AND c.ItemNumber <> 44 --exclusions requested via customer
	AND (c.DollarValue <> 0)
	AND c.IssueDate <= Getdate()	 
;
GO
