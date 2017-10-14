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






CREATE VIEW [dbo].[VE_VW_HV_HotelReservations]
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
-- Author: David Shepherd
-- Date: 2017-07-04
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2017-07-04	1.0					David Shepherd			Initial version.
--=====================================================================================================
SELECT  [_ID]
      ,[Version]
      ,[PlayerID]
      ,[ArrivalDate]
      ,[DepartureDate]
      ,[TotalRooms]
      ,[TotalAdults]
      ,[TotalChildren]
      ,[RoomTypeRequest]
      ,[BedTypeRequest]
      ,[SmokingPreference]
      ,[CompNights]
      ,[BillingProfile]
      ,[CompNumber]
      ,[Notes]
      ,[Status]
      ,[ConfirmationNumber]
      ,[RequestedBy]
      ,[RequestDate]
      ,[ConfirmationDate]
	  ,[EmailFlag]
	  ,[ConfirmedBy]
	  ,[ActionType]
      ,[ModificationDate]
	  ,[Rate]
      ,[LimoPickUp]
      ,[LimoPickUpLocation]
      ,[LimoDestination]
      ,[LimoPickUpDate]
      ,[LimoPickUpTime]
      ,[LimoPickUpCellNumber]
  FROM [dbo].[VE_HV_HotelReservations] (nolock)






GO
