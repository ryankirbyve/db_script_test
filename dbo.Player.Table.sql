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
CREATE TABLE [dbo].[Player](
	[PlayerId] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
	[Title_Old] [varchar](5) NULL,
	[FirstName_Old] [varchar](40) NULL,
	[MiddleName_Old] [varchar](40) NULL,
	[LastName_Old] [varchar](40) NULL,
	[SSN] [varchar](16) NULL,
	[DateEnrolled] [datetime] NULL,
	[AttractionNumber] [int] NULL,
	[Exempt] [char](1) NULL,
	[EnrollmentSource] [int] NULL,
	[PinNumber] [int] NULL,
	[PinLocked] [char](1) NULL,
	[Birthday] [datetime] NULL,
	[AnniversaryDate] [datetime] NULL,
	[CurrentDay] [datetime] NOT NULL,
	[CurrentTrip] [int] NOT NULL,
	[CurrentDayBeginDate] [datetime] NOT NULL,
	[XLastUpdated] [datetime] NOT NULL,
	[AbandonedCard] [char](1) NOT NULL,
	[NickName_Old] [varchar](40) NULL,
	[ID1] [varchar](20) NULL,
	[Gender] [char](1) NULL,
	[SiteID] [smallint] NOT NULL,
	[PINDigest] [char](60) NULL,
	[Sentinel] [int] NULL,
	[EncryptIndex] [int] NULL,
	[FailedPINAttempts] [smallint] NULL,
	[Seed] [char](21) NULL,
	[LanguageID] [smallint] NULL,
	[AffiliationID] [smallint] NULL,
	[Mosaic1] [char](1) NULL,
	[Mosaic2] [int] NULL,
	[SourceID] [int] NULL,
	[SuffixID] [tinyint] NULL,
	[GenerationID] [tinyint] NULL,
	[WebEnabled] [char](1) NOT NULL,
	[WebLastVisitDate] [datetime] NULL,
	[WebLoginCount] [int] NOT NULL,
	[CompanyName] [nvarchar](64) NULL,
	[JobTitle] [nvarchar](40) NULL,
	[YearsAtCompany] [datetime] NULL,
	[YearsInIndustry] [datetime] NULL,
	[BusinessTypeID] [int] NULL,
	[RefusedID] [char](1) NULL,
	[ChristianizedName_Old] [varchar](40) NULL,
	[NameSoundex_Old] [char](8) NULL,
	[DPID] [int] NULL,
	[SmartCardEnabled] [bit] NULL
) ON [PRIMARY]
GO
