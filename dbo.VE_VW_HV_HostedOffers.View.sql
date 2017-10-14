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
CREATE VIEW [dbo].[VE_VW_HV_HostedOffers]
AS
SELECT VE_VW_HV_PlayerHost.HostID
	,VE_VW_HV_Player.PlayerID
	,VE_OFFER_CODE.OFFER_CODE_ID
	,VE_OFFER_CODE.NAME
	,VE_OFFER_CODE.DESCRIPTION
	,CAST(VE_OFFER_CODE.START_DATE AS DATE) AS START_DATE
	,CAST(VE_OFFER_CODE.END_DATE AS DATE) AS END_DATE
	,CAST(VE_OFFER_CODE.Value AS INT) AS Value
	,VE_OFFER_CODE.Type
FROM VE_VW_HV_Player
INNER JOIN VE_SEGMENT_CUSTOMER
	ON VE_SEGMENT_CUSTOMER.CUSTOMER_ID = VE_VW_HV_Player.PlayerID
INNER JOIN VE_SEGMENT_OFFER_CODE
	ON VE_SEGMENT_OFFER_CODE.SEGMENT_ID = VE_SEGMENT_CUSTOMER.SEGMENT_ID
INNER JOIN VE_OFFER_CODE
	ON VE_OFFER_CODE.OFFER_CODE_ID = VE_SEGMENT_OFFER_CODE.OFFER_CODE_ID
INNER JOIN VE_VW_HV_PlayerHost
	ON VE_VW_HV_Player.PlayerID = VE_VW_HV_PlayerHost.PlayerID


;
GO
