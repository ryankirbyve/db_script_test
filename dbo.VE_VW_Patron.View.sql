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
CREATE VIEW [dbo].[VE_VW_Patron] AS
SELECT
	AccountId
	, Active
	, PatronId
	, SiteId
	, RegistrationDate
	, FirstName
	, MiddleName
	, LastName
	, Prefix
	, Suffix
	, Generation
	, RankId
	, SSN
	, DOB
	, Anniversary
	, Sex
	, Race
	, Height
	, Build
	, Hair
	, Eyes
	, Age
	, Description
	, LastPlayDate
	, CTRStatus
	, CTRCount
	, CTRDate
	, CashDeposit
	, CreditLimit
	, CreditAvailable
	, TTO
	, InTransitCredit
	, CreditOnHold
	, CreditStatus
	, LastMarkerDate
	, IssueMarker
	, RedeemMarker
	, PointBalance
	, CompValue
	, CasinoHostId
	, HotelGuest
	, Refused
	, Verified
	, Discreet
	, DetailsPurged
	, ForcePending
FROM
	HostViz_IGT_Patron.dbo.Patron;
GO
