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
CREATE TABLE [dbo].[VE_SEGMENT](
	[SEGMENT_ID] [varchar](24) NOT NULL,
	[NAME] [varchar](256) NULL,
	[CAMPAIGN_ID] [varchar](24) NULL,
	[DESCRIPTION] [varchar](256) NULL,
	[SEGMENT_TYPE] [varchar](32) NULL,
	[parent_segment_id] [varchar](32) NULL
) ON [PRIMARY]
GO
