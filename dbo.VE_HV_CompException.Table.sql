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
CREATE TABLE [dbo].[VE_HV_CompException](
	[_ID] [varchar](36) NOT NULL,
	[Version] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[CompType] [varchar](36) NULL,
	[CompAmount] [decimal](18, 0) NULL,
	[Notes] [varchar](max) NULL,
	[Status] [varchar](10) NULL,
	[Requestor] [varchar](30) NULL,
	[RequestDate] [datetime] NULL,
	[ConfirmationDate] [datetime] NULL,
	[EmailFlag] [bit] NULL,
	[ConfirmedBy] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[VE_HV_CompException] ADD  DEFAULT ((0)) FOR [Version]
GO
ALTER TABLE [dbo].[VE_HV_CompException] ADD  DEFAULT ('New') FOR [Status]
GO
ALTER TABLE [dbo].[VE_HV_CompException] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
