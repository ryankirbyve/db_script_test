﻿/*    ==Scripting Parameters==

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
CREATE TABLE [dbo].[VE_HV_COMMUNICATION](
	[CommunicationType] [varchar](15) NULL,
	[Description] [varchar](80) NULL,
	[HostComments] [varchar](4000) NULL,
	[CreateDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[VersionNum] [int] NULL,
	[CommunicationID] [varchar](36) NOT NULL,
	[HostID] [varchar](36) NULL,
	[PlayerID] [int] NULL,
	[Duration] [int] NULL,
	[CustomerTemperature] [tinyint] NULL,
	[offer] [varchar](40) NULL,
	[offeraccept] [varchar](10) NULL,
	[offercomment] [varchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CommunicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VE_HV_COMMUNICATION] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
