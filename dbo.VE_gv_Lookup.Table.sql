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
CREATE TABLE [dbo].[VE_gv_Lookup](
	[RowId] [varchar](36) NOT NULL,
	[VersionNum] [int] NOT NULL,
	[LookupName] [varchar](25) NULL,
	[LookupValue] [varchar](40) NOT NULL,
	[DefaultValue] [tinyint] NULL,
	[ParentKey] [varchar](25) NULL,
	[LookupKey] [varchar](25) NULL
) ON [PRIMARY]
GO
