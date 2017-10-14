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
CREATE TABLE [dbo].[VE_HV_ApplicationPreferences](
	[_ID] [varchar](36) NOT NULL,
	[_Version] [int] NOT NULL,
	[Name] [varchar](55) NOT NULL,
	[Value1] [varchar](255) NOT NULL,
	[Value2] [varchar](255) NULL,
	[Value3] [varchar](255) NULL,
	[SiteID] [int] NOT NULL,
 CONSTRAINT [PK_VE_HV_ApplicationPreferences] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_VE_HV_ApplicationPreferences] UNIQUE NONCLUSTERED 
(
	[_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VE_HV_ApplicationPreferences] ADD  CONSTRAINT [DF_VE_HV_ApplicationPreferences$_ID]  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_HV_ApplicationPreferences] ADD  CONSTRAINT [DF_VE_HV_ApplicationPreferences$_Version]  DEFAULT ((1)) FOR [_Version]
GO
ALTER TABLE [dbo].[VE_HV_ApplicationPreferences] ADD  CONSTRAINT [DF_VE_HV_ApplicationPreferences$SiteID]  DEFAULT ((1)) FOR [SiteID]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Highlight and execute the following statement to drop the trigger
before executing the create statement.

DROP TRIGGER dbo.trg_BIS2_Template_Delete;

*/
CREATE TRIGGER [dbo].[trg_VE_AppPref]
   ON  [dbo].[VE_HV_ApplicationPreferences]
   INSTEAD OF DELETE
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
-- Author: Pfander
-- Date: 2017-07-28
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2017-07-28	1.0					Pfander			Initial version.
--=====================================================================================================


BEGIN
	ROLLBACK TRANSACTION
	SET NOCOUNT ON;

    -- Insert statements for trigger here

END
GO
ALTER TABLE [dbo].[VE_HV_ApplicationPreferences] ENABLE TRIGGER [trg_VE_AppPref]
GO
