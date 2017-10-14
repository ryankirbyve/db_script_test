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
CREATE TABLE [dbo].[VE_SEGMENT_OFFER_CODES](
	[SEGMENT_ID] [varchar](24) NOT NULL,
	[OFFER_CODE_ID] [varchar](24) NOT NULL,
	[offer_value] [int] NULL,
	[offer_type] [varchar](256) NULL,
	[START_DATE] [smalldatetime] NULL,
	[END_DATE] [smalldatetime] NULL
) ON [PRIMARY]
GO
