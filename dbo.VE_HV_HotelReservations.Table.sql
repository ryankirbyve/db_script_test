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
CREATE TABLE [dbo].[VE_HV_HotelReservations](
	[_ID] [varchar](36) NOT NULL,
	[Version] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[ArrivalDate] [date] NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[TotalRooms] [int] NOT NULL,
	[TotalAdults] [int] NOT NULL,
	[TotalChildren] [int] NULL,
	[RoomTypeRequest] [varchar](20) NULL,
	[BedTypeRequest] [varchar](20) NULL,
	[SmokingPreference] [varchar](3) NULL,
	[CompNights] [int] NULL,
	[BillingProfile] [varchar](36) NULL,
	[CompNumber] [varchar](36) NULL,
	[Notes] [varchar](max) NULL,
	[Status] [varchar](10) NULL,
	[ConfirmationNumber] [varchar](36) NULL,
	[RequestedBy] [varchar](36) NULL,
	[RequestDate] [datetime] NULL,
	[ConfirmationDate] [datetime] NULL,
	[EmailFlag] [int] NULL,
	[ConfirmedBy] [varchar](100) NULL,
	[ActionType] [varchar](10) NULL,
	[ModificationDate] [datetime] NULL,
	[Rate] [decimal](18, 0) NULL,
	[LimoPickUp] [varchar](5) NULL,
	[LimoPickUpLocation] [varchar](100) NULL,
	[LimoDestination] [varchar](100) NULL,
	[LimoPickUpDate] [datetime] NULL,
	[LimoPickUpTime] [varchar](50) NULL,
	[LimoPickUpCellNumber] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[VE_HV_HotelReservations] ADD  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_HV_HotelReservations] ADD  DEFAULT ((0)) FOR [Version]
GO
ALTER TABLE [dbo].[VE_HV_HotelReservations] ADD  DEFAULT ('New') FOR [Status]
GO
ALTER TABLE [dbo].[VE_HV_HotelReservations] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pfander
-- Create date: 2017-08-10
-- Description:	updates modification Date each time there is an update statement.
-- =============================================
CREATE TRIGGER [dbo].[trg_VE_HotelRes_Update_ModDate]
   ON  [HostViz_IGT_Template].[dbo].[VE_HV_HotelReservations]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



    Update [HostViz_IGT_Template].[dbo].[VE_HV_HotelReservations] Set ModificationDate = getdate() Where _ID = (Select _ID from Inserted)

END
GO
ALTER TABLE [dbo].[VE_HV_HotelReservations] ENABLE TRIGGER [trg_VE_HotelRes_Update_ModDate]
GO
