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
CREATE TABLE [dbo].[VE_HV_PREFERENCE](
	[PreferenceID] [varchar](36) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[PreferenceTypeID] [varchar](36) NULL,
	[PreferenceDetail] [varchar](4000) NULL,
	[CreateDate] [datetime] NULL,
	[VersionNum] [int] NULL,
 CONSTRAINT [PK__BIS2_HV___E228490F36208C94] PRIMARY KEY CLUSTERED 
(
	[PreferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
