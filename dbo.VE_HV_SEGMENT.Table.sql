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
CREATE TABLE [dbo].[VE_HV_SEGMENT](
	[Name] [varchar](30) NULL,
	[Type] [varchar](15) NULL,
	[Description] [varchar](50) NULL,
	[CreateDate] [datetime2](7) NULL,
	[VersionNum] [int] NULL,
	[SegmentID] [varchar](36) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SegmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
