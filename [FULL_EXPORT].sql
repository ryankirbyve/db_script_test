/*    ==Scripting Parameters==

    Source Server Version : Version120 (12.0.2000)
    Source Database Engine Edition : Enterprise
    Source Database Engine Type : Standalone

    Target Server Version : Version130
    Target Database Engine Edition : Enterprise
    Target Database Engine Type : Standalone
*/
USE [master]
GO
CREATE DATABASE [HostViz_IGT_Template]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HostViz_IGT_Template', FILENAME = N'C:\SQL_DB\HostViz_IGT_Template.mdf' , SIZE = 109568KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HostViz_IGT_Template_log', FILENAME = N'C:\SQL_DB\HostViz_IGT_Template_log.ldf' , SIZE = 15040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HostViz_IGT_Template] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HostViz_IGT_Template].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HostViz_IGT_Template] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET ARITHABORT OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HostViz_IGT_Template] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HostViz_IGT_Template] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HostViz_IGT_Template] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HostViz_IGT_Template] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HostViz_IGT_Template] SET  MULTI_USER 
GO
ALTER DATABASE [HostViz_IGT_Template] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HostViz_IGT_Template] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HostViz_IGT_Template] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HostViz_IGT_Template] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HostViz_IGT_Template] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HostViz_IGT_Template', N'ON'
GO
USE [HostViz_IGT_Template]
GO
CREATE USER [VIZ_RR2016_HostViz] FOR LOGIN [VIZ_RR2016_HostViz] WITH DEFAULT_SCHEMA=[dbo]
GO
CREATE USER [HostViz_IGT_Template_User] FOR LOGIN [HostViz_IGT_Template_User] WITH DEFAULT_SCHEMA=[dbo]
GO
CREATE USER [greetviz_template_user] FOR LOGIN [greetviz_template_user] WITH DEFAULT_SCHEMA=[dbo]
GO
CREATE USER [bis2_hostvizpackage_tst] FOR LOGIN [bis2_hostvizpackage_tst] WITH DEFAULT_SCHEMA=[dbo]
GO
CREATE USER [BIS2\brocheb] FOR LOGIN [BIS2\brocheb] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [VIZ_RR2016_HostViz]
GO
ALTER ROLE [db_datareader] ADD MEMBER [VIZ_RR2016_HostViz]
GO
ALTER ROLE [db_owner] ADD MEMBER [HostViz_IGT_Template_User]
GO
ALTER ROLE [db_owner] ADD MEMBER [greetviz_template_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [bis2_hostvizpackage_tst]
GO
ALTER ROLE [db_owner] ADD MEMBER [BIS2\brocheb]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BIS2\brocheb]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [BIS2\brocheb]
GO
CREATE SYNONYM [dbo].[PlayerDay_staging_xxxx] FOR [HostVizPackage_Test].[dbo].[PlayerDay_staging]
GO
CREATE SYNONYM [dbo].[PlayerDay_staging_xxxxx] FOR [HostViz_IGT_Template].[dbo].[PlayerDay_staging]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dates_TRT_Test](
	[AccountingDate] [date] NULL,
	[TP_Start] [date] NULL,
	[TP_End] [date] NULL,
	[LP_Start] [date] NULL,
	[LP_End] [date] NULL
) ON [PRIMARY]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playerday](
	[PlayerId] [int] NOT NULL,
	[SiteID] [smallint] NOT NULL,
	[TripNumber] [int] NOT NULL,
	[AccountingDate] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Slot_Sessions] [int] NOT NULL,
	[Slot_TimePlayed] [int] NOT NULL,
	[Slot_CoinIn] [money] NOT NULL,
	[Slot_CoinOut] [money] NOT NULL,
	[Slot_Games] [int] NOT NULL,
	[Slot_Jackpot] [money] NOT NULL,
	[Slot_BillsIn] [money] NOT NULL,
	[Slot_TheoWin] [money] NOT NULL,
	[Slot_CompEarned] [money] NOT NULL,
	[Slot_PointsEarned] [int] NOT NULL,
	[Slot_XC_Used] [money] NOT NULL,
	[Slot_XC_RPEarned] [money] NOT NULL,
	[Slot_XC_PPEarned] [money] NOT NULL,
	[Slot_XC_BSEarned] [money] NOT NULL,
	[Slot_RP_PointAdjustment] [int] NOT NULL,
	[Slot_RP_EarnedDay] [int] NOT NULL,
	[Slot_PointsUsed] [int] NOT NULL,
	[Slot_CompUsed] [money] NOT NULL,
	[Table_Sessions] [int] NOT NULL,
	[Table_ChipsIn] [money] NOT NULL,
	[Table_ChipsOut] [money] NOT NULL,
	[Table_Games] [int] NOT NULL,
	[Table_PointsEarned] [int] NOT NULL,
	[Table_TheoWin] [money] NOT NULL,
	[Table_CompEarned] [money] NOT NULL,
	[Table_TimePlayed] [int] NOT NULL,
	[Table_AmtWagered] [money] NOT NULL,
	[Table_Win] [money] NOT NULL,
	[Table_CashBuyIn] [money] NOT NULL,
	[Table_NonCashBuyIn] [money] NOT NULL,
	[Table_PointsUsed] [int] NOT NULL,
	[Table_CompUsed] [money] NOT NULL,
	[Archived] [bit] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_CAMPAIGN](
	[CAMPAIGN_ID] [varchar](24) NOT NULL,
	[NAME] [varchar](256) NULL,
	[DESCRIPTION] [varchar](256) NULL,
	[START_DATE] [datetime] NULL,
	[END_DATE] [datetime] NULL,
	[STATUS] [varchar](50) NULL,
	[ISSUING_SITE_ID] [varchar](32) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_Campaign_20170710](
	[CAMPAIGN_ID] [varchar](24) NOT NULL,
	[NAME] [varchar](256) NULL,
	[DESCRIPTION] [varchar](256) NULL,
	[START_DATE] [datetime] NULL,
	[END_DATE] [datetime] NULL,
	[STATUS] [varchar](50) NULL,
	[ISSUING_SITE_ID] [varchar](32) NULL
) ON [PRIMARY]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_ACTION_FACTORY_TEMPLATE](
	[ActionTemplateID] [varchar](36) NOT NULL,
	[UsernameLastModified] [varchar](25) NULL,
	[GenerateType] [varchar](15) NULL,
	[GenerateSubType] [varchar](20) NULL,
	[Description] [varchar](120) NULL,
	[Priority] [smallint] NULL,
	[StartFromDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[AssignHostBehavior] [varchar](12) NOT NULL,
	[AssignHostBehaviorOverflow] [varchar](12) NOT NULL,
	[HostIDAssign] [varchar](36) NULL,
	[HostIDAssignOverflow] [varchar](36) NULL,
	[TemplateCreateDate] [datetime] NULL,
	[TemplateModifiedDate] [datetime] NULL,
	[TriggerEventType] [varchar](15) NULL,
	[TriggerEventSubType] [varchar](20) NULL,
	[DissolveDate] [datetime] NULL,
	[VersionNum] [int] NULL,
	[Name] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActionTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_ACTION_GENERATION](
	[ActionGenerationID] [varchar](36) NOT NULL,
	[ActionTemplateID] [varchar](36) NULL,
	[UsernameLastModified] [varchar](25) NULL,
	[GenerateType] [varchar](15) NULL,
	[GenerateSubType] [varchar](20) NULL,
	[Description] [varchar](120) NULL,
	[Priority] [smallint] NULL,
	[StartFromDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[AssignHostBehavior] [varchar](12) NULL,
	[AssignHostBehaviorOverflow] [varchar](12) NULL,
	[HostIDAssign] [varchar](36) NULL,
	[HostIDAssignOverflow] [varchar](36) NULL,
	[TriggerEventType] [varchar](15) NULL,
	[TriggerEventSubType] [varchar](20) NULL,
	[SegmentID] [varchar](36) NULL,
	[SegmentName] [varchar](30) NULL,
	[SegmentType] [varchar](15) NULL,
	[SourceActionReason] [varchar](30) NULL,
	[CreateDate] [datetime] NULL,
	[VersionNum] [int] NULL,
	[Name] [varchar](25) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_ACTION_TEMPLATE_SEGMENT](
	[ActionTemplateID] [varchar](36) NOT NULL,
	[SegmentID] [varchar](36) NOT NULL,
	[RowID] [varchar](36) NULL,
	[VersionNum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActionTemplateID] ASC,
	[SegmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_AT_HostExclusion](
	[HostID] [int] NOT NULL,
	[SiteID] [int] NULL,
	[Version] [int] NULL,
	[_ID] [varchar](40) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_AT_Metrics](
	[_ID] [varchar](50) NULL,
	[VersionNum] [int] NULL,
	[Metric] [varchar](30) NULL,
	[Metric_Fragment] [varchar](250) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_AT_Rules](
	[Rules_Version] [int] NULL,
	[Rules_PK] [varchar](40) NULL,
	[Rules_Task_ID] [varchar](40) NULL,
	[Metric] [varchar](10) NULL,
	[Metric_Min] [decimal](10, 2) NULL,
	[Metric_Max] [decimal](10, 2) NULL,
	[Time_Period] [decimal](10, 2) NULL,
	[Dim_IN] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_AutoTaskGeneration](
	[_ID] [varchar](36) NOT NULL,
	[Version] [int] NULL,
	[Enabled] [varchar](3) NULL,
	[AutomationType] [varchar](30) NULL,
	[RuleName] [varchar](25) NULL,
	[TaskName] [varchar](256) NULL,
	[TaskDescription] [varchar](50) NULL,
	[TaskType] [varchar](20) NULL,
	[StartDateDeviation] [int] NULL,
	[DueDateDeviation] [int] NULL,
	[DissolveDateDeviation] [int] NULL,
	[TaskPriority] [int] NULL,
	[SiteID] [int] NULL,
	[AssignHostBehavior] [varchar](12) NULL,
	[Specific_HostID] [varchar](20) NULL,
	[Flex_Period] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_AutoTaskGeneration_TRT_Test](
	[_ID] [varchar](36) NOT NULL,
	[Version] [int] NULL,
	[Enabled] [varchar](3) NULL,
	[AutomationType] [varchar](30) NULL,
	[RuleName] [varchar](25) NULL,
	[TaskName] [varchar](256) NULL,
	[TaskDescription] [varchar](50) NULL,
	[TaskType] [varchar](20) NULL,
	[StartDateDeviation] [int] NULL,
	[DueDateDeviation] [int] NULL,
	[DissolveDateDeviation] [int] NULL,
	[TaskPriority] [int] NULL,
	[SiteID] [int] NULL,
	[AssignHostBehavior] [varchar](12) NULL,
	[Specific_HostID] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_AutoTaskLookup](
	[_ID] [varchar](36) NOT NULL,
	[Version] [int] NOT NULL,
	[LookupName] [varchar](25) NULL,
	[LookupValue] [varchar](40) NOT NULL,
	[DefaultValue] [tinyint] NULL,
	[ParentKey] [varchar](25) NULL,
	[LookupKey] [varchar](25) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_AutoTaskLookup_20170801](
	[_ID] [varchar](36) NOT NULL,
	[Version] [int] NOT NULL,
	[LookupName] [varchar](25) NULL,
	[LookupValue] [varchar](40) NOT NULL,
	[DefaultValue] [tinyint] NULL,
	[ParentKey] [varchar](25) NULL,
	[LookupKey] [varchar](25) NULL
) ON [PRIMARY]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_DROPDOWNVALUES](
	[RowId] [varchar](36) NOT NULL,
	[VersionNum] [int] NOT NULL,
	[LookupName] [varchar](25) NULL,
	[LookupValue] [varchar](40) NOT NULL,
	[DefaultValue] [tinyint] NULL,
	[ParentKey] [varchar](25) NULL,
	[Lookupkey] [varchar](25) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_HostList](
	[VIPid] [varchar](36) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[VersionNum] [int] NOT NULL,
	[Department] [varchar](36) NOT NULL,
	[HostID] [int] NOT NULL,
	[QuarterlyNetTheoGoal] [decimal](18, 2) NULL,
	[QNTG_DollarOverRide] [decimal](18, 2) NULL,
	[GoalRating] [varchar](25) NULL,
	[QNTG_GoalValue] [decimal](18, 2) NULL,
	[HostName] [varchar](50) NULL,
	[overallcontactgoal] [decimal](18, 2) NULL,
	[uniquecontactgoal] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[VIPid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_HotelLookup](
	[_ID] [varchar](36) NOT NULL,
	[Version] [int] NOT NULL,
	[LookupName] [varchar](25) NULL,
	[LookupValue] [varchar](40) NOT NULL,
	[DefaultValue] [tinyint] NULL,
	[ParentKey] [varchar](25) NULL,
	[LookupKey] [varchar](25) NULL
) ON [PRIMARY]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_LastTrip](
	[PlayerID] [int] NOT NULL,
	[LastTrip] [date] NULL,
	[TripsOwed] [decimal](38, 12) NULL,
	[DaysSinceLastTrip] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_ManagerHostGroup](
	[HostID] [int] NOT NULL,
	[HostManagerGroup] [int] NULL,
	[LoginName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[HostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_Player_Alerts](
	[_ID] [varchar](36) NOT NULL,
	[_Version] [int] NOT NULL,
	[Description] [varchar](256) NULL,
	[PlayerID] [int] NOT NULL,
	[CreateDtm] [datetime] NULL,
	[Status] [int] NOT NULL,
	[HostID] [varchar](36) NOT NULL,
	[SiteID] [int] NOT NULL,
 CONSTRAINT [PK_VE_HV_Player_Alerts] PRIMARY KEY CLUSTERED 
(
	[_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_PLAYER_SEGMENT](
	[RowID] [varchar](36) NULL,
	[VersionNum] [int] NULL,
	[SegmentID] [varchar](36) NOT NULL,
	[PlayerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC,
	[SegmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_PlayerHost_SCD](
	[PlayerID] [int] NULL,
	[HostID] [int] NULL,
	[Coded_Date] [date] NULL,
	[uncoded_date] [date] NULL,
	[SiteID] [int] NULL
) ON [PRIMARY]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_Site](
	[SiteID] [int] NULL,
	[SiteName] [varchar](30) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_Task](
	[TaskID] [varchar](36) NOT NULL,
	[HostID] [varchar](36) NULL,
	[PlayerID] [int] NOT NULL,
	[ActionGenerationID] [varchar](36) NULL,
	[Type] [varchar](20) NULL,
	[Name] [varchar](25) NULL,
	[Description] [varchar](4000) NULL,
	[DueDate] [datetime] NULL,
	[StartFromDate] [datetime] NULL,
	[ActualStartDate] [datetime] NULL,
	[CompletionDate] [datetime] NULL,
	[Notes] [varchar](4000) NULL,
	[Priority] [smallint] NULL,
	[Status] [varchar](15) NULL,
	[DissolveDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[VersionNum] [int] NULL,
	[IsAutoTask] [int] NULL,
 CONSTRAINT [PK__BIS2_HV___7C6949D10E614135] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_HV_Tier_SCD](
	[PlayerID] [int] NULL,
	[Tier] [varchar](25) NULL,
	[StartDate] [date] NULL,
	[Enddate] [date] NULL,
	[SiteID] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_OFFER_CODE](
	[OFFER_CODE_ID] [varchar](24) NOT NULL,
	[NAME] [varchar](256) NULL,
	[DESCRIPTION] [varchar](256) NULL,
	[START_DATE] [datetime] NULL,
	[END_DATE] [datetime] NULL,
	[Value] [money] NULL,
	[Type] [varchar](256) NULL,
	[PromoID] [int] NULL,
	[TotalPlayersInvited] [int] NULL,
	[TotalOfferValue] [money] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_Offer_Code_20170710](
	[OFFER_CODE_ID] [varchar](24) NOT NULL,
	[NAME] [varchar](256) NULL,
	[DESCRIPTION] [varchar](256) NULL,
	[START_DATE] [datetime] NULL,
	[END_DATE] [datetime] NULL,
	[Value] [money] NULL,
	[Type] [varchar](256) NULL,
	[PromoID] [int] NULL,
	[TotalPlayersInvited] [int] NULL,
	[TotalOfferValue] [money] NULL
) ON [PRIMARY]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_Segment_20170710](
	[SEGMENT_ID] [varchar](24) NOT NULL,
	[NAME] [varchar](256) NULL,
	[CAMPAIGN_ID] [varchar](24) NULL,
	[DESCRIPTION] [varchar](256) NULL,
	[SEGMENT_TYPE] [varchar](32) NULL,
	[parent_segment_id] [varchar](32) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_SEGMENT_CUSTOMER](
	[SEGMENT_ID] [varchar](24) NOT NULL,
	[SUB_SEGMENT_ID] [varchar](24) NULL,
	[CUSTOMER_ID] [varchar](24) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_Segment_Customer_20170710](
	[SEGMENT_ID] [varchar](24) NOT NULL,
	[SUB_SEGMENT_ID] [varchar](24) NULL,
	[CUSTOMER_ID] [varchar](24) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_SEGMENT_CUSTOMER_20170711](
	[SEGMENT_ID] [varchar](24) NOT NULL,
	[SUB_SEGMENT_ID] [varchar](24) NULL,
	[CUSTOMER_ID] [varchar](24) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_SEGMENT_OFFER_CODE](
	[SEGMENT_ID] [varchar](24) NOT NULL,
	[OFFER_CODE_ID] [varchar](24) NOT NULL,
	[offer_value] [int] NULL,
	[offer_type] [varchar](256) NULL,
	[START_DATE] [smalldatetime] NULL,
	[END_DATE] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OFFER_CODE_ID] ASC,
	[SEGMENT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_Segment_Offer_Codes_20170710](
	[SEGMENT_ID] [varchar](24) NOT NULL,
	[OFFER_CODE_ID] [varchar](24) NOT NULL,
	[offer_value] [int] NULL,
	[offer_type] [varchar](256) NULL,
	[START_DATE] [smalldatetime] NULL,
	[END_DATE] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_T_PlayerSession_CurrentOnFloor_Demo](
	[PlayerID] [int] NOT NULL,
	[mnum] [int] NOT NULL,
	[SiteID] [smallint] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[TimePlayed] [int] NULL,
	[Location] [varchar](25) NULL,
	[CoinIn] [decimal](18, 2) NULL,
	[CoinOut] [decimal](18, 2) NULL,
	[Games] [int] NULL,
	[Jackpot] [decimal](18, 2) NULL,
	[BillsIn] [decimal](18, 2) NULL,
	[AverageBet] [decimal](18, 4) NULL,
	[Win] [decimal](18, 4) NULL,
	[TheoWin] [decimal](18, 4) NULL,
	[CompEarned] [decimal](18, 4) NULL,
	[Type] [char](1) NULL,
	[XC_Used] [decimal](18, 2) NULL,
	[PointsEarned] [decimal](18, 4) NULL,
	[PointMultiplier] [varchar](50) NULL,
	[AccountingDate] [date] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VE_tv_SubscribedEvents](
	[_ID] [varchar](250) NOT NULL,
	[_Version] [int] NULL,
	[GamingSystemCode1] [bigint] NOT NULL,
	[GamingSystemCode2] [bigint] NOT NULL,
	[TranslatedDescription] [varchar](250) NULL,
	[IsSubscribed] [bit] NOT NULL,
	[TaskTypeID] [int] NULL,
	[ActionTypeID] [int] NULL,
 CONSTRAINT [PK__VE_tv_Su__DED99714D8081800] PRIMARY KEY CLUSTERED 
(
	[_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzVE_HV_AT_Task_Template](
	[HostID] [int] NULL,
	[NAME] [varchar](35) NULL,
	[description] [varchar](50) NULL,
	[Start_From_Date] [date] NULL,
	[Due_Date] [date] NULL,
	[Host_Assignment] [varchar](25) NULL,
	[Dissolve_Date] [date] NULL,
	[Create_Date] [date] NULL,
	[TMP_Version] [int] NULL,
	[Scheduler] [int] NULL,
	[Template_Task_ID] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_Host]
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
-- Author: Jeffrey Mihalik
-- Date: 24 October 2013
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2016-06-30		2.0				Ryan Kirby			Removed unnecessary fields
--=====================================================================================================
SELECT UserID AS HostID
	,UserID AS UserID
	,SiteID
	,LoginName
	,FirstName AS HostFirst
	,LastName AS HostLast
	,FirstName + ' ' + LastName AS HostName
	,STATUS
	,JobID
	,JobTitle
FROM HostViz_IGT_Patron.dbo.AbsUser WITH (NOLOCK)
Where UserID <> 25
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_UserConstraint] as 
SELECT
h.HostID,
h.LoginName,
h.LoginName as ManagerLogin
FROM
VE_VW_HV_Host h
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[VE_VW_HV_ApplicationPreferences]
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
SELECT [_ID]
      ,[_Version]
      ,[Name]
      ,[Value1]
      ,[Value2]
      ,[Value3]
      ,[SiteID]
  FROM [HostViz_IGT_Template].[dbo].[VE_HV_ApplicationPreferences] (nolock)





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--=====================================================================================================
-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
-- similar notice contained in this sofTheoWinare.
-- Intellectual Property Notice
-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
-- End User License Agreement.
--=====================================================================================================
-- Author: Jeffrey Mihalik
-- Date: December 7th, 2014
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--2014-12-07      1.0               Jeffrey Mihalik             Initial Version
--2014-12-08      1.1               Christopher West            Added Hackjoin 
--=====================================================================================================
CREATE VIEW [dbo].[VE_VW_HV_DailyPlayer]
AS
SELECT 1 AS HackJoin
	,PlayerID
	,SiteID
	,AccountingDate
	--Type,
	,[Slot_TimePlayed] + [Table_TimePlayed] AS TimePlayed
	,[Slot_CoinIn] + [Table_ChipsIn] AS CoinIn
	,[Slot_CoinOut] + [Table_ChipsOut] AS CoinOut
	,[Slot_Games] + [Table_Games] AS Games
	,[Slot_Jackpot] AS Jackpot
	,[Slot_CoinIn] - [Slot_CoinOut] + [Table_Win] AS Win
	,[Slot_TheoWin] + [Table_TheoWin] AS TheoWin
	,[Slot_CompEarned] + [Table_CompEarned] as CompEarned
	,[Slot_XC_Used] AS FreePlay
	,[Slot_XC_PPEarned] AS PointPlay
	,[Slot_XC_BSEarned] AS BonusPlay
	,[Slot_BillsIn] AS BillsIn
	,[Slot_TheoWin] + [Table_TheoWin] - [Slot_XC_Used] AS NetTheoWin
	,[Slot_CoinIn] - [Slot_CoinOut] + [Table_Win] - [Slot_XC_Used] AS NetActualWin
FROM [HostViz_IGT_Patron].[dbo].[PlayerDay]
	--FROM	HostViz_IGT_Template.dbo.BIS2_Daily_Player
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*	*
	* INTELLECTUAL PROPERTY NOTICE
	* Copyright (C) 2008 - 2016 NEW BIS SAFE LUXCO S.A.R.L
	*
	* The VizExplorer software code below is a component of a VizExplorer software solution.
	*
	* If the software code below is in non-source code executable form, then the code is
	* licensed to you on the terms and conditions of VizExplorer’s standard End User License
	* Agreement, a copy of which is located on VizExplorer’s website
	* at: http://www.vizexplorer.com/license-agreements/. By using the software code you
	* agree that you have read and accepted the terms and conditions of VizExplorer’s standard
	* End User License Agreement.
	*
	* If the software code below is in source code form, no license or other permission is
	* granted to you to use the software code.
	*
==========================================================================================
	Date		Vers.	Name				Comments
	2016-11-01	1.0		Kate Skobeleva		Initial version
	2017-02-28	1.1		Alexey Maksimov		Minor changes
	2017-03-10	1.2		Alexey Maksimov		Unified field names, SiteID
	2017-06-07	1.3		Nick Rehagen		Add todays trip metrics seperate from last trip 
	2016-07-13	1.4		Alexey Maksimov		Today_Trip_Win => Today_Trip_Worth,
											Last_Trip_Win => Last_Trip_Worth
	2017-07-26	1.5		Ryan Kirby			Added tw90, aw90, & placeholders for gamepref,
												,compbal, compused, & RI
========================================================================================== */
CREATE VIEW [dbo].[VE_VW_HV_PlayerMetrics]
AS
SELECT statLast.PlayerID AS PatronID
	,1 AS SiteID
	,stat365.ADT AS ADT365
	,stat365.ADA AS ADA365
	,stat365.ADW AS ADW365
	,stat90.ADT AS ADT90
	,stat90.ADA AS ADA90
	,stat90.ADW AS ADW90
	,stat90.TheoWin as TheoWin90
	,stat90.win as win90
	,statLast.Accountingdate AS LastTripDate
	,statLast.Last_Trip_Actual AS LastTripActual
	,statLast.Last_Trip_Theo AS LastTripTheo
	,statLast.Last_Trip_Worth AS LastTripWorth
	,statToday.Accountingdate AS TodayTripDate
	,statToday.Today_Trip_Actual AS TodayTripActual
	,statToday.Today_Trip_Theo AS TodayTripTheo
	,statToday.Today_Trip_Worth AS TodayTripWorth
	,'S' as GamePreference
	,0.00 as CompBalance
	,0.00 as CompUsed
	,0.00 as Reinvestment
FROM (
	SELECT a.PlayerID
		,a.Accountingdate
		,sum(b.win) AS [Last_Trip_Actual]
		,sum(b.TheoWin) AS [Last_Trip_Theo]
		,(
			CASE 
				WHEN SUM(b.TheoWin) > (
						SELECT Value1
						FROM VE_VW_HV_ApplicationPreferences
						WHERE NAME = 'viz_ADWConstant'
						) * SUM(b.win)
					THEN SUM(b.TheoWin)
				ELSE (
						SELECT Value1
						FROM VE_VW_HV_ApplicationPreferences
						WHERE NAME = 'viz_ADWConstant'
						) * SUM(b.win)
				END
			) AS [Last_Trip_Worth]
	FROM (
		SELECT PlayerID
			,Max(Accountingdate) AS Accountingdate
		FROM [dbo].[VE_VW_HV_DailyPlayer] WITH (NOLOCK)
		WHERE AccountingDate <= CAST(Current_timestamp AS DATE)
		GROUP BY PlayerID
		) a
	JOIN [dbo].[VE_VW_HV_DailyPlayer] b WITH (NOLOCK)
		ON a.PlayerID = b.PlayerID
			AND a.Accountingdate = b.Accountingdate
	WHERE b.win <> 0
		OR b.TheoWin <> 0
	GROUP BY a.PlayerID
		,a.Accountingdate
	) statLast
LEFT JOIN (
	SELECT [dbo].[VE_VW_HV_DailyPlayer].PlayerID
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
			ELSE 0
			END AS ADT
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (sum([dbo].[VE_VW_HV_DailyPlayer].win) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate))
			ELSE 0
			END AS ADA
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (
						CASE 
							WHEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) > (
									SELECT Value1
									FROM VE_VW_HV_ApplicationPreferences
									WHERE NAME = 'viz_ADWConstant'
									) * (SUM([dbo].[VE_VW_HV_DailyPlayer].win))
								THEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
							ELSE (
									SELECT Value1
									FROM VE_VW_HV_ApplicationPreferences
									WHERE NAME = 'viz_ADWConstant'
									) * (SUM([dbo].[VE_VW_HV_DailyPlayer].win)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
							END
						)
			ELSE 0
			END AS ADW
	FROM [dbo].[VE_VW_HV_DailyPlayer] WITH (NOLOCK)
	WHERE AccountingDate >= cast(DATEADD(dd, - 364, Getdate()) AS DATE)
	GROUP BY [dbo].[VE_VW_HV_DailyPlayer].PlayerID
	) stat365
	ON statLast.PlayerID = stat365.PlayerID
LEFT JOIN (
	SELECT [dbo].[VE_VW_HV_DailyPlayer].PlayerID
		,SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin) as TheoWin
		,SUM([dbo].[VE_VW_HV_DailyPlayer].win) as win
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
			ELSE 0
			END AS ADT
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (sum([dbo].[VE_VW_HV_DailyPlayer].win) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate))
			ELSE 0
			END AS ADA
		,CASE 
			WHEN COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate) <> 0
				THEN (
						CASE 
							WHEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) > (
									SELECT Value1
									FROM VE_VW_HV_ApplicationPreferences
									WHERE NAME = 'viz_ADWConstant'
									) * (SUM([dbo].[VE_VW_HV_DailyPlayer].win))
								THEN (SUM([dbo].[VE_VW_HV_DailyPlayer].TheoWin)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
							ELSE (
									SELECT Value1
									FROM VE_VW_HV_ApplicationPreferences
									WHERE NAME = 'viz_ADWConstant'
									) * (SUM([dbo].[VE_VW_HV_DailyPlayer].win)) / COUNT(DISTINCT [dbo].[VE_VW_HV_DailyPlayer].AccountingDate)
							END
						)
			ELSE 0
			END AS ADW
	FROM [dbo].[VE_VW_HV_DailyPlayer] WITH (NOLOCK)
	WHERE AccountingDate >= cast(DATEADD(dd, - 89, Getdate()) AS DATE)
	GROUP BY [dbo].[VE_VW_HV_DailyPlayer].PlayerID
	) stat90
	ON statLast.PlayerID = stat90.PlayerID
LEFT JOIN (
	SELECT a.PlayerID
		,a.Accountingdate
		,sum(b.win) AS [Today_Trip_Actual]
		,sum(b.TheoWin) AS [Today_Trip_Theo]
		,(
			CASE 
				WHEN SUM(b.TheoWin) > (
						SELECT Value1
						FROM VE_VW_HV_ApplicationPreferences
						WHERE NAME = 'viz_ADWConstant'
						) * SUM(b.win)
					THEN SUM(b.TheoWin)
				ELSE (
						SELECT Value1
						FROM VE_VW_HV_ApplicationPreferences
						WHERE NAME = 'viz_ADWConstant'
						) * SUM(b.win)
				END
			) AS [Today_Trip_Worth]
	FROM (
		SELECT PlayerID
			,Max(Accountingdate) AS Accountingdate
		FROM [dbo].[VE_VW_HV_DailyPlayer] WITH (NOLOCK)
		WHERE AccountingDate >= CAST(Current_timestamp AS DATE)
		GROUP BY PlayerID
		) a
	JOIN [dbo].[VE_VW_HV_DailyPlayer] b WITH (NOLOCK)
		ON a.PlayerID = b.PlayerID
			AND a.Accountingdate = b.Accountingdate
	WHERE b.win <> 0
		OR b.TheoWin <> 0
	GROUP BY a.PlayerID
		,a.Accountingdate
	) statToday
	ON statLast.PlayerID = statToday.PlayerID

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_PlayerHost]
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
-- Author: Jeffrey Mihalik
-- Date: 24 October 2013
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
--=====================================================================================================
SELECT PlayerID
	,SiteID
	,HostID
FROM HostViz_IGT_Patron.dbo.PlayerHost WITH (NOLOCK)
Where HostID <> 25
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[VE_FN_HV_Hosts] (
	@StartDate DATE
	,@EndDate DATE
	)
	--=====================================================================================================
	-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
	-- similar notice contained in this sofTheoWinare.
	-- Intellectual Property Notice
	-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
	-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
	-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
	-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
	-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
	-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
	-- End User License Agreement.
	--=====================================================================================================
	-- Author: Ryan Kirby
	-- Date: 2016-02-23
	-- Version: 1.0
	-- Notes: 
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
    --04/25/2015		1.0					Jocelyn Alcala			Added Prior Year Quarter
	--=====================================================================================================
RETURNS TABLE
AS
RETURN

--DECLARE @EndDate date = '20160418';
WITH Dates AS(
		SELECT 1 AS Hack
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP), 0)) AS TP_StartDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) + 1, 0)) AS TP_EndDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) - 1, 0)) AS LP_StartDate
			,convert(DATE, DATEADD(q, -1, CURRENT_TIMESTAMP)) AS LP_EndDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, @EndDate) - 4, 0)) AS PQTD_StartDate
			,convert(DATE, DATEADD(q, -3, @EndDate)) AS PQTD_EndDate
		)
	,Hosts AS (
		SELECT VE_VW_HV_Host.HostID
		,VE_VW_HV_Host.HostName
		,VE_VW_HV_Host.LoginName AS LoginName
		,VE_VW_HV_Host.SiteID
		--,VE_VW_HV_Host.SiteCode
	FROM VE_VW_HV_Host
	GROUP BY VE_VW_HV_Host.HostID
		,VE_VW_HV_Host.HostName
		,VE_VW_HV_Host.LoginName
		,VE_VW_HV_Host.SiteID
		--,VE_VW_HV_Host.SiteCode
		)
	,PlayerCount
	AS (
	SELECT ph.hostid
		,COUNT(DISTINCT ph.PlayerID) AS PlayerCount
	FROM VE_VW_HV_PlayerHost AS ph
	GROUP BY ph.hostid
	)
	,ThisPeriod AS (
		SELECT VE_VW_HV_PlayerHost.HostID
			--,VE_VW_HV_DailyPlayer.PlayerID
			
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			--,COUNT(DISTINCT VE_VW_HV_DailyPlayer.AccountingDate) AS Visits
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.TP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.TP_EndDate
		GROUP BY 
		--VE_VW_HV_DailyPlayer.PlayerID,
			VE_VW_HV_PlayerHost.HostID
		)
	,LastPeriod AS (
		SELECT VE_VW_HV_PlayerHost.HostID
			--,VE_VW_HV_DailyPlayer.PlayerID
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.LP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.LP_EndDate
		GROUP BY 
		--VE_VW_HV_DailyPlayer.PlayerID,
			VE_VW_HV_PlayerHost.HostID
		)

	,PriorYearQTD AS (
		--Prior Year Quarter
		SELECT VE_VW_HV_PlayerHost.HostID
			--,VE_VW_HV_DailyPlayer.PlayerID
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.PQTD_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.PQTD_EndDate
		GROUP BY 
		--VE_VW_HV_DailyPlayer.PlayerID,
			VE_VW_HV_PlayerHost.HostID
		)
	,Tasks
AS (
	SELECT VE_HV_HostList.HostID
		,COUNT(DISTINCT VE_HV_TASK.TaskID) AS TasksAssigned
		,SUM(CASE 
				WHEN VE_HV_TASK.STATUS = 'Open'
					THEN 1
				ELSE 0
				END) AS TasksOpen
		,SUM(CASE 
				WHEN VE_HV_TASK.STATUS = 'Unactioned'
					THEN 1
				ELSE 0
				END) AS TasksUnactioned
		,SUM(CASE 
				WHEN VE_HV_TASK.STATUS = 'Closed'
					THEN 1
				ELSE 0
				END) AS TasksCompleted
	FROM VE_HV_HostList
	LEFT JOIN VE_HV_TASK ON VE_HV_TASK.HostID = VE_HV_HostList.HostID
	GROUP BY VE_HV_HostList.HostID
	)
	,Comms
AS (
	SELECT VE_VW_HV_PlayerHost.HostID
		,COUNT(DISTINCT VE_HV_COMMUNICATION.CommunicationID) AS OverallContacts
		,COUNT(DISTINCT VE_HV_COMMUNICATION.PlayerID) AS UniquePlayers
	FROM VE_VW_HV_PlayerHost
	INNER JOIN VE_HV_COMMUNICATION ON VE_VW_HV_PlayerHost.PlayerID = VE_HV_COMMUNICATION.PlayerID
	GROUP BY VE_VW_HV_PlayerHost.HostID
	)

SELECT Hosts.HostID
	,Hosts.LoginName
	,Hosts.HostName
	,PlayerCount.PlayerCount AS Player_Count
	--This Period
	,ThisPeriod.ADT AS TP_ADT
	,ThisPeriod.ADA AS TP_ADA
	,ThisPeriod.TheoWin AS TP_TheoWin
	,ThisPeriod.ActualWin AS TP_ActualWin
	,ThisPeriod.Visits AS TP_Visits
	,ThisPeriod.HoursPlayed AS TP_HoursPlayed
	--Last Period
	,LastPeriod.ADT AS LP_ADT
	,LastPeriod.ADA AS LP_ADA
	,LastPeriod.TheoWin AS LP_TheoWin
	,LastPeriod.ActualWin AS LP_ActualWin
	,LastPeriod.Visits AS LP_Visits
	,LastPeriod.HoursPlayed AS LP_HoursPlayed
	--Prior Year Quarter
	,COALESCE(PriorYearQTD.TheoWin, 0) AS PYQTD_TheoWin
	,COALESCE(PriorYearQTD.ActualWin, 0) AS PYQTD_ActualWin
	,COALESCE(PriorYearQTD.ADT, 0) AS PYQTD_ADT
	,COALESCE(PriorYearQTD.Visits, 0) AS PYQTD_Visits
	,COALESCE(PriorYearQTD.HoursPlayed, 0) AS PYQTD_HoursPlayed
	,COALESCE(PriorYearQTD.ADA, 0) AS PYQTD_ADA
	-- Variance
	,COALESCE(ThisPeriod.ADT, 0) - COALESCE(LastPeriod.ADT, 0) AS Var_ADT
	,COALESCE(ThisPeriod.ADA, 0) - COALESCE(LastPeriod.ADA, 0) AS Var_ADA
	,COALESCE(ThisPeriod.TheoWin, 0) - COALESCE(LastPeriod.TheoWin, 0) AS Var_TheoWin
	,COALESCE(ThisPeriod.ActualWin, 0) - COALESCE(LastPeriod.ActualWin, 0) AS Var_ActualWin
	,COALESCE(ThisPeriod.Visits, 0) - COALESCE(LastPeriod.Visits, 0) AS Var_Visits
	,COALESCE(ThisPeriod.HoursPlayed, 0) - COALESCE(LastPeriod.HoursPlayed, 0) AS Var_HoursPlayed
	,Comms.OverallContacts as CommsTotal --total
	,Comms.UniquePlayers as CommsUnique --unique
	,Tasks.TasksAssigned --total
	,Tasks.TasksOpen as OpenTasks --open
	,Tasks.TasksUnactioned as UnactionedTasks --unactioned
	,Comms.OverallContacts
	,Comms.UniquePlayers
	,Tasks.TasksCompleted as CompletedTasks --complete
	--,Hosts.SiteID
	--,Hosts.SiteCode
FROM Hosts
LEFT JOIN PlayerCount
	ON Hosts.HostID = PlayerCount.hostid
LEFT JOIN ThisPeriod
	ON Hosts.HostID = ThisPeriod.HostID
LEFT JOIN LastPeriod
	ON Hosts.HostID = LastPeriod.HostID
	LEFT JOIN PriorYearQTD
	ON Hosts.HostID = PriorYearQTD.HostID
LEFT JOIN Comms
	ON Hosts.HostID = Comms.HostID
LEFT JOIN Tasks
	ON Hosts.HostID = Tasks.HostID
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










--=====================================================================================================
-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
-- similar notice contained in this sofTheoWinare.
-- Intellectual Property Notice
-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
-- End User License Agreement.
--=====================================================================================================
-- Author: Tonya Talbot
-- Date: 20161117
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--2016-11-17      1.0               Tonya Talbot             Initial Version
--=====================================================================================================
CREATE VIEW [dbo].[VE_VW_HV_MosaicPlayer]
AS
SELECT VE_VW_HV_PlayerHost.PlayerID
	--,CAST(VE_VW_HV_PlayerHost.PlayerID AS VARCHAR) AS PlayerIDVar  /*attempted to make a varchar version to get rid of commas*/
	,HostID
	,Accountingdate
	,1 AS CorpLevel
	,VE_VW_HV_DailyPlayer.SiteID
	,TheoWin AS TheoWin
	,Win AS ActualWin
	,CompEarned
	,-1*Freeplay as Freeplay
	,Jackpot
	,1 AS Visits
	,RIGHT(CAST(DATEPART(yy, Accountingdate) AS VARCHAR), 2) AS YearLabel
	,'Q' + CAST(DATEPART(qq, Accountingdate) AS VARCHAR) AS QuarterLabel
	,'Q' + CAST(DATEPART(qq, Accountingdate) AS VARCHAR) +' '+RIGHT(CAST(DATEPART(yy, Accountingdate) AS VARCHAR), 2) AS QuarterYearLabel
	,LEFT(CAST(DATENAME(mm, Accountingdate) AS VARCHAR), 3) AS MonthLabel
	,LEFT(CAST(DATENAME(mm, Accountingdate) AS VARCHAR), 3) +' '+RIGHT(CAST(DATEPART(yy, Accountingdate) AS VARCHAR), 2) AS MonthYearLabel
	,CAST(DATEPART(dd, Accountingdate) AS VARCHAR) AS DayofMonthLabel
	,CAST(DATEPART(week,AccountingDate) AS VARCHAR) AS WeekofYearLabel
	,CAST(DATEPART(DAYOFYEAR,AccountingDate) AS VARCHAR) AS DayofYearLabel
	,CAST(DATENAME(dw,AccountingDate) AS VARCHAR) AS DayofWeekLabel
	,CASE 
		WHEN AccountingDate <= DATEADD(yy, - 1, Getdate())
			AND accountingDate >= DATEADD(month, DATEDIFF(month, 0, Dateadd(yy, - 1, Getdate())), 0)
			THEN 1
		ELSE 0
		END AS PYMTDFlag
	,CASE 
		WHEN AccountingDate <= DATEADD(yy, - 1, Getdate())
			AND accountingDate >= DATEADD(qq, DATEDIFF(qq, 0, Dateadd(yy, - 1, Getdate())), 0)
			THEN 1
		ELSE 0
		END AS PYQTDFlag
	,CASE 
		WHEN AccountingDate <= DATEADD(yy, - 1, Getdate())
			AND accountingDate >= DATEADD(year, DATEDIFF(year, 0, Dateadd(yy, - 1, Getdate())), 0)
			THEN 1
		ELSE 0
		END AS PYTDFlag
FROM VE_VW_HV_DailyPlayer
INNER JOIN VE_VW_HV_PlayerHost
	ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
WHERE VE_VW_HV_DailyPlayer.AccountingDate >=DATEADD(YEAR, DATEDIFF(YEAR, 0,DATEADD(YEAR, -1, GETDATE())), 0) --beginning of Last Year
	AND VE_VW_HV_DailyPlayer.AccountingDate <= CURRENT_TIMESTAMP --Needed in the Demo but not necessary in a customer database









GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[VE_FN_HV_MosaicRankedPlayers] (
	@StartDate DATE
	,@EndDate DATE
	)
	--=====================================================================================================
	-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
	-- similar notice contained in this sofTheoWinare.
	-- Intellectual Property Notice
	-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
	-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
	-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
	-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
	-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
	-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
	-- End User License Agreement.
	--=====================================================================================================
	-- Author: Cory Clanin
	-- Date: December 30, 2015
	-- Version: 1.0
	-- Notes: 
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
	
	--=====================================================================================================
RETURNS TABLE
AS
RETURN
--DECLARE @ENDDATE DATE = Current_timestamp;

WITH Metrics AS (
SELECT
VE_VW_HV_DailyPlayer.PlayerID
,HostID
,VE_VW_HV_DailyPlayer.SiteID
,SUM(Theowin) AS TheoWin
,SUM(Win) AS ActualWin
,-1.0*SUM(Win) AS PlayerWin
,SUM(Games) AS GamesPlayed
,SUM(Jackpot) AS Jackpot
,SUM(VE_VW_HV_DailyPlayer.FreePlay) AS Freeplay
,COUNT (DISTINCT CAST(VE_VW_HV_DailyPlayer.PlayerID AS varchar) + CAST(Accountingdate AS Varchar)) AS Visits
,CASE WHEN COUNT (DISTINCT CAST(VE_VW_HV_DailyPlayer.PlayerID AS varchar) + CAST(Accountingdate AS Varchar)) <> 0
	THEN SUM(TheoWin) / COUNT (DISTINCT CAST(VE_VW_HV_DailyPlayer.PlayerID AS varchar) + CAST(Accountingdate AS Varchar))
	ELSE 0
	END AS ADT
,CASE WHEN COUNT (DISTINCT CAST(VE_VW_HV_DailyPlayer.PlayerID AS varchar) + CAST(Accountingdate AS Varchar))<> 0
	THEN SUM(Win) / COUNT (DISTINCT CAST(VE_VW_HV_DailyPlayer.PlayerID AS varchar) + CAST(Accountingdate AS Varchar))
	ELSE 0
	END AS ADA
FROM VE_VW_HV_DailyPlayer
INNER JOIN VE_VW_HV_PlayerHost
	ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
WHERE VE_VW_HV_DailyPlayer.AccountingDate >= @StartDate
	AND VE_VW_HV_DailyPlayer.AccountingDate <= @EndDate
GROUP BY VE_VW_HV_DailyPlayer.PlayerID,HostID,VE_VW_HV_DailyPlayer.SiteID
)

SELECT
PlayerId
,1 AS CorpLevel
,@StartDate AS Norm
,HostID
,siteID
,GamesPlayed
,Jackpot
,Freeplay
,TheoWin
,Visits
,Row_Number() OVER ( ORDER BY TheoWin DESC) AS TheoWinRanking
,ActualWin
,Row_Number() OVER ( ORDER BY ActualWin DESC) AS ActualWinRank
,PlayerWin
,Row_Number() OVER ( ORDER BY PlayerWin DESC) AS PlayerWinRank
,ADT
,Row_Number() OVER ( ORDER BY ADT DESC) AS ADTRank
,ADA
,Row_Number() OVER ( ORDER BY ADA DESC) AS ADARank
FROM Metrics
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[VE_FN_HV_HostManagerSummary] (
	@StartDate DATE
	,@EndDate DATE
	)
	--=====================================================================================================
	-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
	-- similar notice contained in this sofTheoWinare.
	-- Intellectual Property Notice
	-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
	-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
	-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
	-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
	-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
	-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
	-- End User License Agreement.
	--=====================================================================================================
	-- Author: Cory Clanin
	-- Date: January 4, 2016
	-- Version: 1.0
	-- Notes: 
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
	-- 2016-06-21		2.0				Ryan Kirby			-- Removed unnecessary joins for performance
	--														-- Commented out playergroup stuff from joins for performance
	--														-- Fixed variance calculations
	-- 2017-01-03		2.1				Tonya Talbot		--Added Case when to all divisions
	--=====================================================================================================
RETURNS TABLE
AS
RETURN
WITH Dates AS(
		SELECT 1 AS Hack
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP), 0)) AS TP_StartDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) + 1, 0)) AS TP_EndDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) - 1, 0)) AS LP_StartDate
			,convert(DATE, DATEADD(q, -1, CURRENT_TIMESTAMP)) AS LP_EndDate
		)
	,Hosts AS (
		SELECT @StartDate AS Norm
			,COUNT(DISTINCT VE_VW_HV_Host.HostID) AS HostCount
			,COUNT(DISTINCT VE_VW_HV_PlayerHost.PlayerID) AS PlayerCount
		FROM VE_VW_HV_Host
		LEFT JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_Host.hostid = VE_VW_HV_PlayerHost.hostid
		)
	,ThisPeriod AS (
		-- This Period
		SELECT COUNT(DISTINCT VE_VW_HV_DailyPlayer.PlayerID) AS PlayerCount
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed / 3600.0) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.TP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.TP_EndDate
		)
	,LastPeriod AS (
		-- Last Period
		SELECT COUNT(DISTINCT VE_VW_HV_DailyPlayer.PlayerID) AS PlayerCount
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed / 3600.0) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.LP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.LP_EndDate

		)
	,Tasks AS (
		SELECT COUNT(VE_HV_TASK.TaskID) AS TasksAssigned
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Open' AND HostID IS NOT NULL
						THEN VE_HV_TASK.TaskID 
					ELSE NULL
					END) AS TasksOpen
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Unactioned' AND HostID IS NOT NULL
						THEN VE_HV_TASK.TaskID
					ELSE NULL
					END) AS TasksUnactioned
			
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Closed' AND HostID IS NOT NULL
						THEN VE_HV_TASK.TaskID
					ELSE NULL
					END) AS TasksCompleted
		FROM VE_HV_TASK
		)
	,Comms AS(
	SELECT COUNT(DISTINCT VE_HV_COMMUNICATION.CommunicationID) AS OverallContacts
		,COUNT(DISTINCT VE_HV_COMMUNICATION.PlayerID) AS UniquePlayers
		,COUNT(DISTINCT VE_HV_COMMUNICATION.CommunicationID) AS CommsLoggedTotal
		,COUNT(DISTINCT VE_HV_COMMUNICATION.PlayerID) AS CommsLoggedUnique
	FROM VE_HV_COMMUNICATION
		)

SELECT Hosts.HostCount
	,Hosts.PlayerCount
	,Hosts.Norm
	,ThisPeriod.PlayerCount AS NumberOfPlayersThisPeriod
	,CASE WHEN cast(Hosts.PlayerCount AS DECIMAL) <> 0
		THEN cast(ThisPeriod.PlayerCount AS DECIMAL) / cast(Hosts.PlayerCount AS DECIMAL)
		ELSE 0
		END AS PercentOfHostedPlayersThisPeriod
	--Maintenance
	,NULL AS PG1_TheoWin
	,NULL AS PG1_ActualWin
	,NULL AS PG1_ADT
	,NULL AS PG1_Visits
	,NULL AS PG1_HoursPlayed
	,NULL AS PG1_ADA
	--Inactive
	,NULL AS PG2_TheoWin
	,NULL AS PG2_ActualWin
	,NULL AS PG2_ADT
	,NULL AS PG2_Visits
	,NULL AS PG2_HoursPlayed
	,NULL AS PG2_ADA
	--New Play
	,NULL AS PG3_TheoWin
	,NULL AS PG3_ActualWin
	,NULL AS PG3_ADT
	,NULL AS PG3_Visits
	,NULL AS PG3_HoursPlayed
	,NULL AS PG3_ADA
	--Gold
	,NULL AS PG4_TheoWin
	,NULL AS PG4_ActualWin
	,NULL AS PG4_ADT
	,NULL AS PG4_Visits
	,NULL AS PG4_HoursPlayed
	,NULL AS PG4_ADA
	--Platinum
	,NULL AS PG5_TheoWin
	,NULL AS PG5_ActualWin
	,NULL AS PG5_ADT
	,NULL AS PG5_Visits
	,NULL AS PG5_HoursPlayed
	,NULL AS PG5_ADA
	--This Period
	,COALESCE(ThisPeriod.TheoWin, 0) AS TP_TheoWin
	,COALESCE(ThisPeriod.ActualWin, 0) AS TP_ActualWin
	,COALESCE(ThisPeriod.ADT, 0) AS TP_ADT
	,COALESCE(ThisPeriod.Visits, 0) AS TP_Visits
	,COALESCE(ThisPeriod.HoursPlayed, 0) AS TP_HoursPlayed
	,COALESCE(ThisPeriod.ADA, 0) AS TP_ADA
	--Last Period
	,COALESCE(LastPeriod.TheoWin, 0) AS LP_TheoWin
	,COALESCE(LastPeriod.ActualWin, 0) AS LP_ActualWin
	,COALESCE(LastPeriod.ADT, 0) AS LP_ADT
	,COALESCE(LastPeriod.Visits, 0) AS LP_Visits
	,COALESCE(LastPeriod.HoursPlayed, 0) AS LP_HoursPlayed
	,COALESCE(LastPeriod.ADA, 0) AS LP_ADA
	--Variance
	,COALESCE(ThisPeriod.TheoWin, 0) - COALESCE(LastPeriod.TheoWin, 0) AS V_TheoWin
	,COALESCE(ThisPeriod.ActualWin, 0) - COALESCE(LastPeriod.ActualWin, 0) AS V_ActualWin
	,COALESCE(ThisPeriod.ADT, 0) - COALESCE(LastPeriod.ADT, 0) AS V_ADT
	,COALESCE(ThisPeriod.Visits, 0) - COALESCE(LastPeriod.Visits, 0) AS V_Visits
	,COALESCE(ThisPeriod.HoursPlayed, 0) - COALESCE(LastPeriod.HoursPlayed, 0) AS V_HoursPlayed
	,COALESCE(ThisPeriod.ADA, 0) - COALESCE(LastPeriod.ADA, 0) AS V_ADA
	,Tasks.TasksAssigned
	,Tasks.TasksOpen
	,Tasks.TasksUnactioned
	,Tasks.TasksCompleted
	,Comms.OverallContacts
	,Comms.UniquePlayers
	,Comms.CommsLoggedTotal
	,Comms.CommsLoggedUnique
FROM Hosts
LEFT JOIN Tasks
	ON 1 = 1
LEFT JOIN Comms
	ON 1 = 1
LEFT JOIN ThisPeriod
	ON 1 = 1
LEFT JOIN LastPeriod
	ON 1 = 1
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


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
-- Author: Ryan Kirby
-- Date: 2016-06-21
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2016-06-21		1.0				Ryan Kirby				Initial commit.
--=====================================================================================================
CREATE VIEW [dbo].[VE_VW_HV_LastTrip_live]
AS
(
		SELECT PH.PlayerID
			,MAX(CAST(VE_VW_HV_DailyPlayer.AccountingDate AS DATE)) AS LastTrip
			,CASE 
				WHEN CASE 
						WHEN COUNT(DISTINCT VE_VW_HV_DailyPlayer.AccountingDate) - 1 <> 0
							THEN DATEDIFF(dd, min(VE_VW_HV_DailyPlayer.AccountingDate), MAX(VE_VW_HV_DailyPlayer.AccountingDate)) / CAST((COUNT(DISTINCT VE_VW_HV_DailyPlayer.AccountingDate)) - 1 AS DECIMAL(15, 2))
						ELSE 0
						END <> 0
					THEN DATEDIFF(dd, MAX(VE_VW_HV_DailyPlayer.AccountingDate), MAX(CURRENT_TIMESTAMP)) / CASE 
							WHEN COUNT(DISTINCT VE_VW_HV_DailyPlayer.AccountingDate) - 1 <> 0
								THEN DATEDIFF(dd, MIN(VE_VW_HV_DailyPlayer.AccountingDate), MAX(VE_VW_HV_DailyPlayer.AccountingDate)) / CAST((COUNT(DISTINCT VE_VW_HV_DailyPlayer.AccountingDate)) - 1 AS DECIMAL(15, 2))
							ELSE 0
							END
				ELSE 0
				END AS TripsOwed
			,datediff(dd, max(VE_VW_HV_DailyPlayer.AccountingDate), MAX(CURRENT_TIMESTAMP)) AS DaysSinceLastTrip
		FROM VE_VW_HV_DailyPlayer
		INNER JOIN VE_VW_HV_PlayerHost PH ON PH.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.Accountingdate <= CURRENT_TIMESTAMP
		GROUP BY PH.PlayerID
		)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_HostedPlayerRank]
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
-- Author: Ryan Kirby
-- Date: 2016-06-30
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--	2016-06-30		1.0				Ryan Kirby			Initial commit
--=====================================================================================================
SELECT PlayerSiteGroup.PlayerID
	,Ranking.Description
FROM HostViz_IGT_Patron.dbo.PlayerSiteGroup WITH (NOLOCK)
INNER JOIN HostViz_IGT_Template.dbo.VE_VW_HV_PlayerHost
	ON VE_VW_HV_PlayerHost.PlayerID = PlayerSiteGroup.PlayerID
INNER JOIN HostViz_IGT_Patron.dbo.Ranking WITH (NOLOCK)
	ON PlayerSiteGroup.RankingID = Ranking.RankingNumber
	
;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[VE_FN_HV_HostIDLookup] (@loginNameVar VARCHAR(50))
	--=====================================================================================================
	-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
	-- similar notice contained in this sofTheoWinare.
	-- Intellectual Property Notice
	-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
	-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
	-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
	-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
	-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
	-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
	-- End User License Agreement.
	--=====================================================================================================
	-- Author: Ryan Kirby
	-- Date: 2016-03-22
	-- Version: 1.0
	-- Notes: Looks up hostID given a loginname, and allows users the ability to masquerade as other users
	--			in active directory setups.
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
	-- 2016-03-22		1.0					Ryan Kirby			Initial commit.
	--=====================================================================================================
RETURNS TABLE
AS
RETURN
WITH masquerade AS (
		SELECT '99999' AS HostID
			,'vendorbiz2' AS LoginName
		
		UNION ALL
		
		SELECT '0' AS HostID
			,'hostmanager' AS LoginName
		)
	,main_lookup AS (
		SELECT HostID
			,LoginName
		FROM VE_VW_HV_Host
		WHERE HostID NOT IN (
				SELECT DISTINCT HostID
				FROM masquerade
				)
		UNION ALL
		SELECT HostID
			,LoginName
		FROM
			masquerade
		)

SELECT HostID
FROM main_lookup
WHERE UPPER(LoginName) = UPPER(@loginNameVar);
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
-- Author: Ryan Kirby 
-- Date: 2016-01-12
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 
--=====================================================================================================
CREATE VIEW [dbo].[VE_VW_HV_HostedComps]
AS
SELECT h.hostID
	,h.hostID as UserID
	,c.IssuedTo AS PlayerID
	,ct.Description AS TypeDescription
	,cl.Description AS Description
	,CASE 
		WHEN c.TypeID <> 1
			THEN 'Yes'
		ELSE 'No'
		END AS HostIssued
	,cl.STATUS AS STATUS
	,c.IssueDate AS IssueDate
	,ca.SlotValue + ca.TableValue AS CompUsed
	,c.AccountingDate AS RedeemedDate
	,CAST(c.DollarValue AS INT) AS DollarValue
	,c.UserID AS ComporID
FROM HostViz_IGT_Patron.dbo.Comp AS c WITH (NOLOCK) 
LEFT JOIN HostViz_IGT_Template.dbo.VE_VW_HV_Host AS h WITH (NOLOCK) 
	ON c.UserID = h.HostID
LEFT JOIN HostViz_IGT_Patron.dbo.CompList AS cl WITH (NOLOCK) 
	ON c.ItemNumber = cl.ItemNumber
LEFT JOIN HostViz_IGT_Patron.dbo.CompAllocation AS ca WITH (NOLOCK) 
	ON c.CompID = ca.CompID
LEFT JOIN HostViz_IGT_Patron.dbo.CompType AS ct WITH (NOLOCK) 
	ON c.TypeID = ct.TypeID
WHERE c.IssueDate >= DATEADD(mm, - 3, CURRENT_TIMESTAMP)
	AND c.ItemNumber <> 44 --exclusions requested via customer
	AND (c.DollarValue <> 0)
	AND c.IssueDate <= Getdate()	 
;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VE_VW_ActiveTablePlay]
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
-- Author: David John Shepherd
-- Date: 22 April 2016
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
--=====================================================================================================
SELECT isnull(tcardout.PlayerID, tcardin.PlayerID) AS PlayerID
	,CASE 
		WHEN isnull(tcardout.EventTime, '1993-01-01 00:00:00') > isnull(tcardin.EventTime, '1993-01-01 00:00:00')
			THEN tcardout.EventTime
		ELSE tcardin.EventTime
		END AS EVENTTIME
	--,isnull(tcardout.EventTime, tcardin.EventTime) AS EventTime
	,CASE 
		WHEN isnull(tcardout.EventTime, '1993-01-01 00:00:00') > isnull(tcardin.EventTime, '1993-01-01 00:00:00')
			THEN tcardout.Location
		ELSE tcardin.Location
		END AS Location
	--,isnull(tcardout.Location, tcardin.Location) AS Location
	,CASE 
		WHEN isnull(tcardout.EventTime, '1993-01-01 00:00:00') > isnull(tcardin.EventTime, '1993-01-01 00:00:00')
			THEN tcardout.IsCardOut
		ELSE tcardin.IsCardOut
		END AS IsCardOut
--,isnull(tcardout.IsCardOut, tcardin.IsCardOut) AS IscardOut
FROM (
	SELECT EventTime
		,PlayerID
		,Location
		,Iscardout
	FROM (
		SELECT dateadd(hh, - 4, timein) AS EventTime
			,HostViz_IGT_Patron.dbo.patron.patronID AS PlayerID
			,HostViz_IGT_Patron.dbo.location.NAME AS location
			,CASE 
				WHEN Timeout IS NULL
					THEN 'CardIn'
				ELSE 'CardOut'
				END AS isCardOut
			,rank() OVER (
				PARTITION BY HostViz_IGT_Patron.dbo.[Rating].Accountid ORDER BY timein DESC
				) AS rank
		FROM HostViz_IGT_Patron.dbo.[Rating]
		INNER JOIN HostViz_IGT_Patron.dbo.location ON HostViz_IGT_Patron.dbo.[Rating].locationID = HostViz_IGT_Patron.dbo.location.LocationId
		INNER JOIN HostViz_IGT_Patron.dbo.patron ON HostViz_IGT_Patron.dbo.[Rating].accountid = HostViz_IGT_Patron.dbo.patron.accountid
		WHERE timein >= DATEADD(mi, - 30, GETUTCDATE())
			--AND tablemanager.tms.patron.rankid IS NOT NULL
		) t1
	WHERE rank = 1
		AND Iscardout = 'CardOut'
	) tcardout
FULL OUTER JOIN (
	SELECT EventTime
		,PlayerID
		,Location
		,Iscardout
	FROM (
		SELECT dateadd(hh, - 4, timein) AS EventTime
			,HostViz_IGT_Patron.dbo.patron.patronID AS PlayerID
			,HostViz_IGT_Patron.dbo.location.NAME AS location
			,CASE 
				WHEN Timeout IS NULL
					THEN 'CardIn'
				ELSE 'CardOut'
				END AS isCardOut
			,rank() OVER (
				PARTITION BY HostViz_IGT_Patron.dbo.[Rating].Accountid ORDER BY timein DESC
				) AS rank
		FROM HostViz_IGT_Patron.dbo.[Rating]
		INNER JOIN HostViz_IGT_Patron.dbo.location ON HostViz_IGT_Patron.dbo.[Rating].locationID = HostViz_IGT_Patron.dbo.location.LocationId
		INNER JOIN HostViz_IGT_Patron.dbo.patron ON HostViz_IGT_Patron.dbo.[Rating].accountid = HostViz_IGT_Patron.dbo.patron.accountid
		WHERE timein >= DATEADD(hh, - 24, GETUTCDATE())
			--AND tablemanager.tms.patron.rankid IS NOT NULL
		) t2
	WHERE rank = 1
		AND Iscardout = 'Cardin'
	) tcardin ON tcardout.playerid = tcardin.playerid



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VE_VW_HV_PlayerDetail]
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
-- Author: Terence Trezevant
-- Date: 24 October 2013
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
-- 02 Nov 2013  1.0  Irina    Comment IN statement 
-- 03 Mar 2014  1.1  Komkrit Yensirikul  Remove "IsPreferredName = 0"
-- 6/18/2014        1.2    Bryan Skellett/Julian Woodhouse     Remove SiteID restriction 
-- 20 Aug 2014  1.3  Judy Schroeder   Remove commas
-- 2016-02-22	1.4		Ryan Kirby		Removed Age Band
--=====================================================================================================
SELECT p.PlayerID
	,pn.FirstName
	,pn.LastName
	,p.SiteID
	,p.STATUS
	,p.BirthDay
	,CASE 
		WHEN DATEADD(YEAR, DATEDIFF(YEAR, p.Birthday, CURRENT_TIMESTAMP), p.Birthday) > CURRENT_TIMESTAMP
			THEN DATEDIFF(YEAR, p.Birthday, CURRENT_TIMESTAMP) - 1
		ELSE DATEDIFF(YEAR, p.Birthday, CURRENT_TIMESTAMP)
		END AS Age
	,DATENAME(MM, p.Birthday) AS BirthMonth
	,p.DateEnrolled
	,p.Gender
	,pa.Line1
	,pa.Zipcode
	,pa.City
	,pa.STATE
	,pp.Phone
	,pp.Preferred
	,pp.AllowMessages
	,pe.Email
	,pe.DefaultEmail
	,d.PostalMailOptIn
	,d.EmailOptIn
	,d.TextMessagingOptIn
	,d.PhoneOptIn
	,case 
	   when p.Status='X'  Then 'Y'
	 else 'N' End as IsBanned
FROM [HostViz_IGT_Patron].[dbo].[Player] AS p WITH (NOLOCK)
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerAddress] AS pa WITH (NOLOCK)
	ON pa.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerPhone] AS pp WITH (NOLOCK)
	ON pp.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerEmail] AS pe WITH (NOLOCK)
	ON pe.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerName] AS pn WITH (NOLOCK)
	ON pn.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[DirectMarketingPlayerConfig] AS d WITH (NOLOCK)
	ON d.playerid = p.playerid



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_PlayerSession] AS
SELECT
	PlayerID
	, mnum
	, SiteID
	, DATEADD(mm,-6,EndTime) EndTime
	, DATEADD(mm,-6,StartTime) StartTime
	, TimePlayed
	, Location
	, CoinIn
	, CoinOut
	, Games
	, Jackpot
	, BillsIn
	, AverageBet
	, Win
	, TheoWin
	, CompEarned
	, Type
	, XC_Used
	, PointsEarned
	, PointMultiplier
	, DATEADD(mm,-6,AccountingDate) AccountingDate
FROM
	HostViz_IGT_Template.dbo.VE_T_PlayerSession_CurrentOnFloor_Demo
UNION ALL
SELECT  
	PlayerID
	, mnum
	, SiteID
	, EndTime
	, StartTime
	, TimePlayed
	, Location
	, CoinIn
	, CoinOut
	, Games
	, Jackpot
	, BillsIn
	, AverageBet
	, Win
	, TheoWin
	, CompEarned
	, Type
	, XC_Used
	, PointsEarned
	, PointMultiplier
	, AccountingDate
FROM
	HostViz_IGT_Template.dbo.VE_T_PlayerSession_CurrentOnFloor_Demo;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VE_VW_HV_Current_Players_On_Floor]
AS
----=====================================================================================================
---- The following Intellectual Property Notice applies to all software code below and replaces any
---- similar notice contained in this software.
---- Intellectual Property Notice
---- 
---- Copyright (c) 2013 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
---- The BIS2 software code below is a component of BIS2's gameViz(tm) software solution (which may include,
---- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
---- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
---- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq. 
---- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
---- End User License Agreement.
----=====================================================================================================
---- Author: David John Shepherd
---- Date: 12 February 2016
---- Version: 1.0
---- Notes: 
----=====================================================================================================
----  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
----=====================================================================================================
----2016-08-05     1.0               Nick Rehagen					Inital Version-Rewriting VE_VW_Current_Player_OnFloor
----2016-12-30     2.0				Tonya Talbot			Rewritten for performance and readability
----=====================================================================================================

--Should contain a list of Players with card in or a card out event in the last 2 hours, along with dimensions related to these players
WITH Players
AS (
	SELECT AP.PlayerID
		,PD.FirstName
		,PD.LastName
		,Host.HostName
		,AP.location
		,AP.IsCardOut
		,PR.Description AS Tier--Card Tier
	FROM VE_VW_ActiveTablePlay AP
	INNER JOIN VE_VW_HV_PlayerDetail PD --Make sure this playerDetail includes unhosted Players
		ON PD.PlayerId = AP.PlayerID
	LEFT JOIN VE_VW_HV_PlayerHost PH
		ON PH.PlayerID = AP.PlayerID --Left join because we allow unhosted
	LEFT JOIN VE_VW_HV_Host AS host ON host.HostID = PH.HostID
	LEFT JOIN VE_VW_HV_HostedPlayerRank PR
		ON PR.PlayerID = AP.PlayerID
	WHERE AP.EventTime >= DATEADD(mi, - 120, getdate())
	)
	,Communication
AS (
	SELECT PlayerID
		,HostID AS LastContactedBy
		,CreateDate AS LastContact
		,DATEDIFF(dd,CreateDate,getdate()) AS DaysSinceCommunication
	FROM (
		SELECT PlayerID
			,HostID
			,CreateDate
			,Row_Number() OVER (
				PARTITION BY VE_HV_Communication.PlayerID ORDER BY CreateDate DESC
				) AS RN
		FROM VE_HV_Communication
		) Comm_RN
	WHERE RN = 1
	)
	,CurrentQuarterPlay
AS (
	SELECT playerday.PlayerID AS PlayerID
		,SUM(([CoinIn] - [CoinOut])) AS CQActual
		,count(DISTINCT AccountingDate) AS CQVisits
		,SUM(TheoWin) AS CQTheo
	FROM HostViz_IGT_Template.dbo.VE_VW_HV_PlayerSession playerday
	WHERE AccountingDate >= convert(DATE, DATEADD(q, DATEDIFF(q, 0, getdate()), 0))
		AND AccountingDate < convert(DATE, DATEADD(q, DATEDIFF(q, 0, getdate()) + 1, 0))
	GROUP BY playerday.PlayerID
	)
	,TodaysPlay
AS (
	SELECT PlayerID AS PlayerID
		,SUM(TheoWin) AS TodaysTheo
		,((sum([CoinIn]) - sum([CoinOut])) /*- sum([Slot_Jackpot])*/) AS TodaysWin
	FROM HostViz_IGT_Template.dbo.VE_VW_HV_PlayerSession playerday
	WHERE (CAST(AccountingDate AS DATE) = CAST(getdate() AS DATE))
		AND EndTime <= getdate()
	GROUP BY PlayerID
	)
SELECT Players.PlayerID
	,Players.HostName
	,TodaysPlay.TodaysTheo
	,1 AS Siteid
	,Players.Location AS Mnum
	,Players.Location
	,Players.Tier
	,Players.IsCardOut
	,TodaysPlay.TodaysWin
	,Communication.LastcontactedBy AS LastContactBy
	,CASE 
		WHEN TodaysPlay.TodaysTheo > 250
			AND Communication.DaysSinceCommunication > 1
			THEN 'Yes'
		WHEN TodaysPlay.TodaysTheo > 250
			AND Communication.DaysSinceCommunication IS NULL
			THEN 'Yes'
		ELSE 'No'
		END AS Hot
	,CASE 
		WHEN Players.HostName IS NULL
			THEN 'No'
		ELSE 'Yes'
		END AS Hosted
	,Communication.DaysSinceCommunication AS DaysSinceCommunication
	,Communication.Lastcontact AS LastContacted
	,CurrentQuarterPlay.CQActual
	,CurrentQuarterPlay.CQTheo
	,CurrentQuarterPlay.CQVisits
FROM Players
LEFT JOIN Communication ON Communication.PlayerID = Players.PlayerID
LEFT JOIN TodaysPlay ON TodaysPlay.PlayerID = Players.PlayerID 
LEFT JOIN CurrentQuarterPlay ON CurrentQuarterPlay.PlayerID = Players.PlayerID;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_Player]
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
-- Author: Terence Trezevant
-- Date: 24 October 2013
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
-- 02 Nov 2013  1.0  Irina    Comment IN statement 
-- 03 Mar 2014  1.1  Komkrit Yensirikul  Remove "IsPreferredName = 0"
-- 6/18/2014        1.2    Bryan Skellett/Julian Woodhouse     Remove SiteID restriction 
-- 20 Aug 2014  1.3  Judy Schroeder   Remove commas
-- 2016-02-22	1.4		Ryan Kirby		Removed Age Band
-- 2017-05-19	1.5		Ryan Kirby		testing version control; formatted.
--=====================================================================================================
SELECT PlayerID
	,FirstName_Old FirstName
	,LastName_Old LastName
	,SiteID
	,STATUS
	,BirthDay
	,DateEnrolled
	,Gender
	,CASE 
		WHEN DATEADD(YEAR, DATEDIFF(YEAR, Birthday, CURRENT_TIMESTAMP), Birthday) > CURRENT_TIMESTAMP
			THEN DATEDIFF(YEAR, Birthday, CURRENT_TIMESTAMP) - 1
		ELSE DATEDIFF(YEAR, Birthday, CURRENT_TIMESTAMP)
		END AS Age
	,DATENAME(MM, Birthday) AS BirthMonth
FROM [HostViz_IGT_Patron].[dbo].[Player]
;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_HostedOffers]
AS
SELECT VE_VW_HV_PlayerHost.HostID
	,VE_VW_HV_Player.PlayerID
	,VE_OFFER_CODE.OFFER_CODE_ID
	,VE_OFFER_CODE.NAME
	,VE_OFFER_CODE.DESCRIPTION
	,CAST(VE_OFFER_CODE.START_DATE AS DATE) AS START_DATE
	,CAST(VE_OFFER_CODE.END_DATE AS DATE) AS END_DATE
	,CAST(VE_OFFER_CODE.Value AS INT) AS Value
	,VE_OFFER_CODE.Type
FROM VE_VW_HV_Player
INNER JOIN VE_SEGMENT_CUSTOMER
	ON VE_SEGMENT_CUSTOMER.CUSTOMER_ID = VE_VW_HV_Player.PlayerID
INNER JOIN VE_SEGMENT_OFFER_CODE
	ON VE_SEGMENT_OFFER_CODE.SEGMENT_ID = VE_SEGMENT_CUSTOMER.SEGMENT_ID
INNER JOIN VE_OFFER_CODE
	ON VE_OFFER_CODE.OFFER_CODE_ID = VE_SEGMENT_OFFER_CODE.OFFER_CODE_ID
INNER JOIN VE_VW_HV_PlayerHost
	ON VE_VW_HV_Player.PlayerID = VE_VW_HV_PlayerHost.PlayerID


;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_HitSheet]
AS
SELECT VE_VW_HV_PlayerHost.PlayerID
			,VE_VW_HV_PlayerHost.HostID
			,VE_VW_HV_Player.Age
			,VE_VW_HV_Player.Gender
			,VE_VW_HV_Player.Birthday
			,VE_VW_HV_Player.BirthMonth
			,VE_VW_HV_Player.DateEnrolled
			,VE_VW_HV_PlayerDetail.FirstName
			,VE_VW_HV_PlayerDetail.LastName
			,VE_VW_HV_HostedPlayerRank.[Description] AS Tier
			,VE_VW_HV_PlayerDetail.PostalMailOptIn AS EmailOptIn
			,VE_VW_HV_PlayerDetail.PhoneOptIn
			,VE_VW_HV_PlayerDetail.Phone
			,VE_VW_HV_PlayerDetail.Email
			,VE_VW_HV_PlayerDetail.Line1 AS Address
			,VE_VW_HV_PlayerDetail.City
			,VE_VW_HV_PlayerDetail.STATE
			,VE_VW_HV_PlayerDetail.ZipCode
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
		FROM VE_VW_HV_PlayerHost
		LEFT JOIN VE_VW_HV_PlayerDetail
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_PlayerDetail.PlayerID
		LEFT JOIN VE_VW_HV_DailyPlayer
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID	
		LEFT JOIN VE_VW_HV_Player
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_Player.PlayerID
		LEFT JOIN VE_VW_HV_HostedPlayerRank
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_HostedPlayerRank.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= DATEADD(dd,-3,'20160401')
			AND VE_VW_HV_DailyPlayer.AccountingDate < CURRENT_TIMESTAMP
		GROUP BY VE_VW_HV_PlayerHost.PlayerID
			,VE_VW_HV_PlayerHost.HostID
			,VE_VW_HV_Player.Age
			,VE_VW_HV_Player.Gender
			,VE_VW_HV_Player.Birthday
			,VE_VW_HV_Player.BirthMonth
			,VE_VW_HV_Player.DateEnrolled
			,VE_VW_HV_PlayerDetail.FirstName 
			,VE_VW_HV_PlayerDetail.LastName 
			,VE_VW_HV_HostedPlayerRank.[Description] 
			,VE_VW_HV_PlayerDetail.PostalMailOptIn
			,VE_VW_HV_PlayerDetail.PhoneOptIn
			,VE_VW_HV_PlayerDetail.Phone
			,VE_VW_HV_PlayerDetail.Email
			,VE_VW_HV_PlayerDetail.Line1  
			,VE_VW_HV_PlayerDetail.City
			,VE_VW_HV_PlayerDetail.STATE
			,VE_VW_HV_PlayerDetail.ZipCode
		HAVING 
			CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END > 250
;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[VE_FN_HV_HostViewSummary] (
	@StartDate DATE
	,@EndDate DATE
	)
	--======================================================================r===============================
	-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
	-- similar notice contained in this sofTheoWinare.
	-- Intellectual Property Notice
	-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
	-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
	-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
	-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
	-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
	-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
	-- End User License Agreement.
	--=====================================================================================================
	-- Author: Cory Clanin
	-- Date: January 4, 2016
	-- Version: 1.0
	-- Notes: 
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
	-- 2017-01-03		2.1				Tonya Talbot		Added Case when to all divisions
	--=====================================================================================================
RETURNS TABLE
AS
RETURN
WITH Dates AS(
		SELECT 1 AS Hack
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP), 0)) AS TP_StartDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) + 1, 0)) AS TP_EndDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) - 1, 0)) AS LP_StartDate
			,convert(DATE, DATEADD(q, -1, CURRENT_TIMESTAMP)) AS LP_EndDate
		)
	 ,Hosts
AS (
	SELECT @StartDate AS norm
		,VE_VW_HV_Host.HostID
		,VE_VW_HV_Host.HostName
		,VE_VW_HV_Host.LoginName AS LoginName
	FROM VE_VW_HV_Host
	GROUP BY VE_VW_HV_Host.HostID
		,VE_VW_HV_Host.HostName
		,VE_VW_HV_Host.LoginName
	)
	,PlayerCount
AS (
	SELECT ph.hostid
		,COUNT(DISTINCT ph.PlayerID) AS PlayerCount
	FROM VE_VW_HV_PlayerHost AS ph
	GROUP BY ph.hostid
	)
	,ThisPeriod AS (
		-- ThisPeriod
		SELECT VE_VW_HV_PlayerHost.HostID
			,COUNT(DISTINCT VE_VW_HV_DailyPlayer.PlayerID) AS PlayerCount
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.
							AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) 
							+ cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.
							AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + 
							cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS 
					VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed / 3600.0) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.TP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.TP_EndDate
		GROUP BY VE_VW_HV_PlayerHost.HostID
		)
	,LastPeriod AS (
		-- LastPeriod
		SELECT VE_VW_HV_PlayerHost.HostID
			,COUNT(DISTINCT VE_VW_HV_DailyPlayer.PlayerID) AS PlayerCount
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.
							AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) 
							+ cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.
							AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + 
							cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS 
					VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed / 3600.0) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.LP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.LP_EndDate
		GROUP BY VE_VW_HV_PlayerHost.HostID
		)
	
	,Tasks AS (
		SELECT VE_HV_HostList.HostID
			,COUNT(DISTINCT VE_HV_TASK.TaskID) AS TasksAssigned
			,SUM(CASE 
					WHEN VE_HV_TASK.STATUS = 'Open'
						THEN 1
					ELSE 0
					END) AS TasksOpen
			,SUM(CASE 
					WHEN VE_HV_TASK.STATUS = 'Unactioned'
						THEN 1
					ELSE 0
					END) AS TasksUnactioned
			,SUM(CASE 
					WHEN VE_HV_TASK.STATUS = 'Closed'
						THEN 1
					ELSE 0
					END) AS TasksCompleted
		FROM VE_HV_HostList
		LEFT JOIN VE_HV_TASK
			ON VE_HV_TASK.HostID = VE_HV_HostList.HostID
		GROUP BY VE_HV_HostList.HostID
		)
	,Comms AS (
		SELECT VE_VW_HV_PlayerHost.HostID
			,COUNT(DISTINCT VE_HV_COMMUNICATION.CommunicationID) AS OverallContacts
			,COUNT(DISTINCT VE_HV_COMMUNICATION.PlayerID) AS UniquePlayers
		FROM VE_VW_HV_PlayerHost
		INNER JOIN VE_HV_COMMUNICATION
			ON VE_VW_HV_PlayerHost.PlayerID = VE_HV_COMMUNICATION.PlayerID
		GROUP BY VE_VW_HV_PlayerHost.HostID
		)

SELECT Hosts.HostID
	,Hosts.norm
	,Hosts.HostName
	,Hosts.LoginName
	,PlayerCount.PlayerCount
	,ThisPeriod.PlayerCount AS NumberOfPlayersThisPeriod
	,CASE WHEN cast(PlayerCount.PlayerCount AS DECIMAL) <> 0
		THEN cast(ThisPeriod.PlayerCount AS DECIMAL) / cast(PlayerCount.PlayerCount AS DECIMAL)
		ELSE 0
		END AS PercentOfHostedPlayersThisPeriod
	--Maintenance
	,NULL AS PG1_TheoWin
	,NULL AS PG1_ActualWin
	,NULL AS PG1_ADT
	,NULL AS PG1_Visits
	,NULL AS PG1_HoursPlayed
	,NULL AS PG1_ADA
	--Inactive
	,NULL AS PG2_TheoWin
	,NULL AS PG2_ActualWin
	,NULL AS PG2_ADT
	,NULL AS PG2_Visits
	,NULL AS PG2_HoursPlayed
	,NULL AS PG2_ADA
	--New Play
	,NULL AS PG3_TheoWin
	,NULL AS PG3_ActualWin
	,NULL AS PG3_ADT
	,NULL AS PG3_Visits
	,NULL AS PG3_HoursPlayed
	,NULL AS PG3_ADA
	--Gold
	,NULL AS PG4_TheoWin
	,NULL AS PG4_ActualWin
	,NULL AS PG4_ADT
	,NULL AS PG4_Visits
	,NULL AS PG4_HoursPlayed
	,NULL AS PG4_ADA
	--Platinum
	,NULL AS PG5_TheoWin
	,NULL AS PG5_ActualWin
	,NULL AS PG5_ADT
	,NULL AS PG5_Visits
	,NULL AS PG5_HoursPlayed
	,NULL AS PG5_ADA

	--ThisPeriod
	,COALESCE(ThisPeriod.TheoWin, 0) AS TP_TheoWin
	,COALESCE(ThisPeriod.ActualWin, 0) AS TP_ActualWin
	,COALESCE(ThisPeriod.ADT, 0) AS TP_ADT
	,COALESCE(ThisPeriod.Visits, 0) AS TP_Visits
	,COALESCE(ThisPeriod.HoursPlayed, 0) AS TP_HoursPlayed
	,COALESCE(ThisPeriod.ADA, 0) AS TP_ADA
	--LastPeriod
	,COALESCE(LastPeriod.TheoWin, 0) AS LP_TheoWin
	,COALESCE(LastPeriod.ActualWin, 0) AS LP_ActualWin
	,COALESCE(LastPeriod.ADT, 0) AS LP_ADT
	,COALESCE(LastPeriod.Visits, 0) AS LP_Visits
	,COALESCE(LastPeriod.HoursPlayed, 0) AS LP_HoursPlayed
	,COALESCE(LastPeriod.ADA, 0) AS LP_ADA
	--Variance Metrics
	,COALESCE(ThisPeriod.ADT, 0) - COALESCE(LastPeriod.ADT, 0) AS V_ADT
	,COALESCE(ThisPeriod.ADA, 0) - COALESCE(LastPeriod.ADA, 0) AS V_ADA
	,COALESCE(ThisPeriod.TheoWin, 0) - COALESCE(LastPeriod.TheoWin, 0) AS V_TheoWin
	,COALESCE(ThisPeriod.ActualWin, 0) - COALESCE(LastPeriod.ActualWin, 0) AS V_ActualWin
	,COALESCE(ThisPeriod.Visits, 0) - COALESCE(LastPeriod.Visits, 0) AS V_Visits
	,COALESCE(ThisPeriod.HoursPlayed, 0) - COALESCE(LastPeriod.HoursPlayed, 0) AS V_HoursPlayed
	,Tasks.TasksAssigned
	,Tasks.TasksOpen
	,Tasks.TasksUnactioned
	,Comms.OverallContacts
	,Comms.UniquePlayers
	,Tasks.TasksCompleted
FROM Hosts
LEFT JOIN PlayerCount 
	ON hosts.hostid = playercount.hostid
LEFT JOIN ThisPeriod
	ON ThisPeriod.HostID = Hosts.HostID
LEFT JOIN LastPeriod
	ON LastPeriod.HostID = Hosts.HostID
LEFT JOIN Tasks
	ON Tasks.HostID = Hosts.HostID
LEFT JOIN Comms
	ON Comms.HostID = Hosts.HostID
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


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
-- Author: Ryan Kirby
-- Date: 2016-06-21
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2016-06-21		1.0				Ryan Kirby				Initial commit.
--=====================================================================================================
CREATE VIEW [dbo].[VE_VW_HV_LastTrip]
AS
(
		SELECT [PlayerID]
			,[LastTrip]
			,[TripsOwed]
			,datediff(dd,[LastTrip],current_timestamp) as [DaysSinceLastTrip]
			,1 AS SiteID
		FROM [dbo].[VE_HV_LastTrip] WITH (NOLOCK)
		)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[VE_FN_HV_HostedPlayers] (
	@StartDate DATE
	,@EndDate DATE
	)
	--=====================================================================================================
	-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
	-- similar notice contained in this sofTheoWinare.
	-- Intellectual Property Notice
	-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
	-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
	-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
	-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
	-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
	-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
	-- End User License Agreement.
	--=====================================================================================================
	-- Author: Cory Clanin
	-- Date: December 30, 2015
	-- Version: 1.0
	-- Notes: 
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
	-- 2016-06-21		2.0				Ryan Kirby			Materialized LastTrip
	-- 2016-09-14        3.0             Added dates         Jocelyn Alcala
	--=====================================================================================================
RETURNS TABLE
AS
RETURN
--DECLARE @ENDDATE DATE = Current_timestamp;
WITH Dates AS(
		SELECT 1 AS Hack
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP), 0)) AS TP_StartDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) + 1, 0)) AS TP_EndDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) - 1, 0)) AS LP_StartDate
			,convert(DATE, DATEADD(q, -1, CURRENT_TIMESTAMP)) AS LP_EndDate
		)
	/*,Hosts AS (
		SELECT VE_VW_HV_Host.HostID
			,VE_VW_HV_Host.LoginName
			,VE_VW_HV_Host.HostName
			,1 AS PlayerCount
		FROM VE_VW_HV_Host
		)*/
	,Players AS (
		SELECT VE_VW_HV_PlayerHost.PlayerID
			,VE_VW_HV_PlayerHost.HostID
			,VE_VW_HV_Player.Age
			,VE_VW_HV_Player.Gender
			,VE_VW_HV_Player.Birthday
			,VE_VW_HV_Player.BirthMonth
			,VE_VW_HV_Player.DateEnrolled
			,VE_VW_HV_PlayerDetail.FirstName AS PlayerFirst
			,VE_VW_HV_PlayerDetail.LastName AS PlayerLast
			,VE_VW_HV_HostedPlayerRank.[Description] AS Tier
			,VE_VW_HV_PlayerDetail.PostalMailOptIn
			,VE_VW_HV_PlayerDetail.PhoneOptIn
			,VE_VW_HV_PlayerDetail.Phone
			,VE_VW_HV_PlayerDetail.Email
			,VE_VW_HV_PlayerDetail.Line1 AS StreetAddress
			,VE_VW_HV_PlayerDetail.City
			,VE_VW_HV_PlayerDetail.STATE
			,VE_VW_HV_PlayerDetail.ZipCode
		FROM VE_VW_HV_PlayerHost
		INNER JOIN VE_VW_HV_PlayerDetail
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_PlayerDetail.PlayerID
		INNER JOIN VE_VW_HV_Player
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_Player.PlayerID
		LEFT JOIN VE_VW_HV_HostedPlayerRank
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_HostedPlayerRank.PlayerID
		)
	,ThisPeriod AS (
		SELECT 
			VE_VW_HV_PlayerHost.PlayerID
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed / 3600.00) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.TP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.TP_EndDate
		GROUP BY VE_VW_HV_PlayerHost.PlayerID
		)
	,LastPeriod AS (
		SELECT VE_VW_HV_PlayerHost.PlayerID
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.TheoWin) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADT
			,CASE 
				WHEN count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) <> 0
					THEN sum(VE_VW_HV_DailyPlayer.Win) / count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR))
				ELSE 0
				END AS ADA
			,SUM(VE_VW_HV_DailyPlayer.TheoWin) AS TheoWin
			,SUM(VE_VW_HV_DailyPlayer.Win) AS ActualWin
			,count(DISTINCT cast(VE_VW_HV_DailyPlayer.PlayerID AS VARCHAR) + cast(VE_VW_HV_DailyPlayer.AccountingDate AS VARCHAR)) AS Visits
			,SUM(VE_VW_HV_DailyPlayer.TimePlayed / 3600.00) AS HoursPlayed
		FROM VE_VW_HV_DailyPlayer
		LEFT JOIN Dates
			ON Dates.Hack = VE_VW_HV_DailyPlayer.HackJoin
		INNER JOIN VE_VW_HV_PlayerHost
			ON VE_VW_HV_PlayerHost.PlayerID = VE_VW_HV_DailyPlayer.PlayerID
		WHERE VE_VW_HV_DailyPlayer.AccountingDate >= Dates.LP_StartDate
			AND VE_VW_HV_DailyPlayer.AccountingDate < Dates.LP_EndDate
		GROUP BY VE_VW_HV_PlayerHost.PlayerID
		)
	,Tasks AS (
		SELECT VE_HV_TASK.PlayerID
			,COUNT(DISTINCT VE_HV_TASK.TaskID) AS TasksAssigned
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Open'
						THEN 1
					ELSE NULL
					END) AS OpenTasks
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Unactioned'
						THEN 1
					ELSE NULL
					END) AS UnactionedTasks
			,COUNT(CASE 
					WHEN VE_HV_TASK.STATUS = 'Closed'
						THEN 1
					ELSE NULL
					END) AS CompletedTasks
		FROM VE_HV_TASK
		GROUP BY VE_HV_TASK.PlayerID
		)
	,Comms AS (
		SELECT VE_HV_COMMUNICATION.PlayerID
			,COUNT(DISTINCT VE_HV_COMMUNICATION.PlayerID) AS CommsUnique
			,COUNT(DISTINCT VE_HV_COMMUNICATION.CommunicationID) AS CommsTotal
		FROM VE_HV_COMMUNICATION
		GROUP BY VE_HV_COMMUNICATION.PlayerID
		)
	,LastTrip AS (
		SELECT PlayerID
			,LastTrip
			,TripsOwed
			,DaysSinceLastTrip
		FROM VE_VW_HV_LastTrip
		)

SELECT Hosts.HostID
	,Players.PlayerID
	,Hosts.LoginName
	,Hosts.HostName
	,1 AS Player_Count
	,Players.PlayerFirst
	,Players.PlayerLast
	,Players.Age
	,Players.Gender
	,Players.Birthday
	,Players.DateEnrolled
	,Players.Tier
	,Players.PostalMailOptIn
	,Players.PhoneOptIn
	,Players.BirthMonth
	,Players.Phone
	,Players.Email
	,Players.StreetAddress
	,Players.City
	,Players.STATE
	,Players.ZipCode
	,ThisPeriod.ADT AS TP_ADT
	,ThisPeriod.ADA AS TP_ADA
	,ThisPeriod.TheoWin AS TP_TheoWin
	,ThisPeriod.ActualWin AS TP_ActualWin
	,ThisPeriod.Visits AS TP_Visits
	,ThisPeriod.HoursPlayed AS TP_HoursPlayed
	,LastPeriod.ADT AS LP_ADT
	,LastPeriod.ADA AS LP_ADA
	,LastPeriod.TheoWin AS LP_TheoWin
	,LastPeriod.ActualWin AS LP_ActualWin
	,LastPeriod.Visits AS LP_Visits
	,LastPeriod.HoursPlayed AS LP_HoursPlayed
	,COALESCE(ThisPeriod.ADT, 0) - COALESCE(LastPeriod.ADT, 0) AS Var_ADT
	,COALESCE(ThisPeriod.ADA, 0) - COALESCE(LastPeriod.ADA, 0) AS Var_ADA
	,COALESCE(ThisPeriod.TheoWin, 0) - COALESCE(LastPeriod.TheoWin, 0) AS Var_TheoWin
	,COALESCE(ThisPeriod.ActualWin, 0) - COALESCE(LastPeriod.ActualWin, 0) AS Var_ActualWin
	,COALESCE(ThisPeriod.Visits, 0) - COALESCE(LastPeriod.Visits, 0) AS Var_Visits
	,COALESCE(ThisPeriod.HoursPlayed, 0) - COALESCE(LastPeriod.HoursPlayed, 0) AS Var_HoursPlayed
	,Comms.CommsTotal --total
	,Comms.CommsUnique --unique
	,Tasks.TasksAssigned --total
	,Tasks.OpenTasks --open
	,Tasks.UnactionedTasks --unactioned
	--,Tasks.OverallContacts
	--,Tasks.UniquePlayers
	,Tasks.CompletedTasks --complete
	,LastTrip.LastTrip
	,LastTrip.TripsOwed
	,LastTrip.DaysSinceLastTrip
FROM Players
LEFT JOIN VE_VW_HV_Host Hosts
	ON Players.HostID = Hosts.HostID
LEFT JOIN ThisPeriod
	ON Players.PlayerID = ThisPeriod.PlayerID
LEFT JOIN LastPeriod
	ON Players.PlayerID = LastPeriod.PlayerID
LEFT JOIN Comms
	ON Players.PlayerID = Comms.PlayerID
LEFT JOIN Tasks
	ON Players.PlayerID = Tasks.PlayerID
LEFT HASH JOIN LastTrip
	ON Players.PlayerID = LastTrip.PlayerID
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[VE_VW_ActiveSlotCardsPlaying]
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
-- Author: David John Shepherd
-- Date: 12 February 2016
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
--=====================================================================================================
SELECT isnull(cardout.PlayerID, cardin.PlayerID) AS PlayerID
	,CASE 
		WHEN isnull(cardout.EventTime, '1993-01-01 00:00:00') > isnull(cardin.EventTime, '1993-01-01 00:00:00')
			THEN cardout.EventTime
		ELSE cardin.EventTime
		END AS EVENTTIME
	--,isnull(cardout.EventTime, cardin.EventTime) AS EventTime
	,CASE 
		WHEN isnull(cardout.EventTime, '1993-01-01 00:00:00') > isnull(cardin.EventTime, '1993-01-01 00:00:00')
			THEN cardout.Location
		ELSE cardin.Location
		END AS Location
	,
	--,isnull(cardout.Location, cardin.Location) AS Location
	CASE 
		WHEN isnull(cardout.EventTime, '1993-01-01 00:00:00') > isnull(cardin.EventTime, '1993-01-01 00:00:00 ')
			THEN cardout.IsCardOut
		ELSE cardin.IsCardOut
		END AS IsCardOut
	,
	--,isnull(cardout.IsCardOut, cardin.IsCardOut) AS IscardOut
	CASE 
		WHEN isnull(cardout.EventTime, '1993-01-01 00:00:00 ') > isnull(cardin.EventTime, '1993-01-01 000:00:00 ')
			THEN cardout.cardid
		ELSE cardin.cardid
		END AS cardid
--,isnull(cardout.cardid, cardin.cardid) AS cardid
--,CASE 
--	WHEN isnull(cardout.EventTime, '1993-01-01 00:00:00') > isnull(cardin.EventTime, '1993-01-01 00:00:00')
--		THEN cardout.eventcode
--	ELSE cardin.eventcode
--	END AS eventcode
--,isnull(cardout.eventcode, cardin.eventcode) AS eventcode
FROM (
	SELECT *
	FROM (
		SELECT ci.location
			,ci.insertdate AS eventtime
			,PlayerCard.playerid
			,'CardOut' AS iscardout
			,ci.cardid
			,ROW_NUMBER() OVER (
				PARTITION BY PlayerCard.playerid ORDER BY ci.insertdate DESC
				) AS ranking
		FROM HostViz_IGT_Patron.dbo.cardin ci
		INNER JOIN HostViz_IGT_Patron.dbo.PlayerCard ON ci.cardid = PlayerCard.cardid
		WHERE ci.Completed = 'y'
			AND insertdate > dateadd(mi, - 30, getdatE())
		) f
	WHERE ranking = 1
	) AS CardOut
FULL OUTER JOIN (
	SELECT location
		,playerid
		,insertdate AS eventtime
		,'CardIn' AS Iscardout
		,cardid
	FROM (
		SELECT ci.location
			,event.playerid
			,ci.insertdate
			,ci.cardid
			,ROW_NUMBER() OVER (
				PARTITION BY event.playerid ORDER BY ci.insertdate DESC
				) AS ranking
		FROM HostViz_IGT_Patron.dbo.cardin ci
		INNER JOIN HostViz_IGT_Accounting.dbo.event ON ci.cardid = event.cardid
		WHERE ci.NoLongerActiveCardIn = 0
			AND ci.completed = 'n'
		) t
	WHERE ranking = 1
	) CardIn ON Cardout.playerid = cardin.playerid
--ORDER BY location DESC





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[VE_VW_HV_AbsUser_Mask]
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
-- Author: Jeffrey Mihalik
-- Date: 24 October 2013
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
--=====================================================================================================
SELECT UserID AS HostID
	,UserID AS UserID
	,LoginName
	,Password
	,FirstName AS HostFirst
	,LastName AS HostLast
	,FirstName + ' ' + LastName AS HostName
	,MiddleInitial
	,STATUS
	,PasswordChangeDate
	,License
	,JobID
	,SiteID
	,XRef
	,CommissionPercent
	,DisplayName
	,JobTitle
	,PINDigest
	,PINLocked
	,LastPinChangeTime
	,StaffID
	,LockCount
	,LastLockDate
	,ForcePWChange
	,ActiveDirectoryLogin
	,DomainName
FROM [HostViz_IGT_PATRON].dbo.AbsUser WITH (NOLOCK)
WHERE STATUS = 'A'
--WHERE UserID IN (SELECT HostID FROM BIS2_MT_HV_VIP_HOST)

--union all

--SELECT 123 AS HostID
--	,123 AS UserID
--	,'irina' LoginName
--	,Password
--	,FirstName AS HostFirst
--	,LastName AS HostLast
--	,FirstName + ' ' + LastName AS HostName
--	,MiddleInitial
--	,STATUS
--	,PasswordChangeDate
--	,License
--	,JobID
--	,SiteID
--	,XRef
--	,CommissionPercent
--	,DisplayName
--	,JobTitle
--	,PINDigest
--	,PINLocked
--	,LastPinChangeTime
--	,StaffID
--	,LockCount
--	,LastLockDate
--	,ForcePWChange
--	,ActiveDirectoryLogin
--	,DomainName
--FROM PlayerManagement.dbo.AbsUser WITH (NOLOCK)
--WHERE STATUS = 'A'
----WHERE UserID IN (SELECT HostID FROM BIS2_MT_HV_VIP_HOST)






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VE_VW_HV_AT_Rules_Name_LookUp]
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
-- Author: 
-- Date: 
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================

--=====================================================================================================
  SELECT
  _ID
  ,1 AS Version
  ,'FlexNames' AS [LookupName]
  ,RuleName [LookupValue]
  ,0 [DefaultValue]
  ,NULL [ParentKey]
  ,_ID AS  [LookupKey]
  FROM VE_HV_AutoTaskGeneration
  WHERE AutomationType = 'Flexible' AND Enabled = 'yes'


;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VE_VW_HV_Communication]
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
-- Author: Ryan Kirby
-- Date: 2016-02-23
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2016-02-23	1.0					Ryan Kirby			Initial version.
--=====================================================================================================
SELECT  [CommunicationType]
      ,[Description]
      ,[HostComments]
      ,[CreateDate]
      ,[ModifiedDate]
      ,[VersionNum]
      ,[CommunicationID]
      ,[HostID]
      ,[PlayerID]
      ,[Duration]
      ,[CustomerTemperature]
      ,[offer]
      ,[offeraccept]
      ,[offercomment]
  FROM [HostViz_IGT_Template].[dbo].[BIS2_MT_HV_COMMUNICATION]


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VE_VW_HV_CompException]
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
-- Author: David Shepherd
-- Date: 2017-07-04
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2017-07-04	1.0					David Shepherd			Initial version.
--=====================================================================================================
SELECT [_ID]
      ,[Version]
      ,[PlayerID]
      ,[CompType]
      ,[CompAmount]
      ,[Notes]
      ,[Status]
      ,[Requestor]
      ,[RequestDate]
      ,[ConfirmationDate]
	  ,[EmailFlag]
	  ,[ConfirmedBy]
  FROM [HostViz_IGT_Template].[dbo].[VE_HV_CompException] (nolock)




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_Dates] AS
	--=====================================================================================================
	-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
	-- similar notice contained in this sofTheoWinare.
	-- Intellectual Property Notice
	-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
	-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
	-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
	-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
	-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
	-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
	-- End User License Agreement.
	--=====================================================================================================
	-- Author: Benjamin Edridge
	-- Date: November 1, 2015
	-- Version: 1.0
	-- Notes: 
	--=====================================================================================================
	--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
	--=====================================================================================================
	--=====================================================================================================
SELECT 1 AS Hack
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP), 0)) AS TP_StartDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) + 1, 0)) AS TP_EndDate
			,convert(DATE, DATEADD(q, DATEDIFF(q, 0, CURRENT_TIMESTAMP) - 1, 0)) AS LP_StartDate
			,convert(DATE, DATEADD(q, -1, CURRENT_TIMESTAMP)) AS LP_EndDate
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VE_VW_HV_HostDropdowns]
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
-- Author: Ryan Kirby
-- Date: 2016-03-22
-- Version: 1.0
-- Notes: To automatically look up hostIDs for dropdowns
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
--=====================================================================================================
SELECT NEWID() AS RowID
	,vip.VersionNum
	,'HostList' AS LookupName
	,vip.FirstName + ' ' + vip.LastName AS LookupValue
	,0 AS DefaultValue
	,NULL AS ParentKey
	,vip.hostid AS LookupKey
FROM BIS2_MT_HV_VIP_HOST AS vip
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VE_VW_HV_HostedPlayerDetail]
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
-- Author: Terence Trezevant
-- Date: 24 October 2013
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
-- 02 Nov 2013  1.0  Irina    Comment IN statement 
-- 03 Mar 2014  1.1  Komkrit Yensirikul  Remove "IsPreferredName = 0"
-- 6/18/2014        1.2    Bryan Skellett/Julian Woodhouse     Remove SiteID restriction 
-- 20 Aug 2014  1.3  Judy Schroeder   Remove commas
-- 2016-02-22	1.4		Ryan Kirby		Removed Age Band
--=====================================================================================================
SELECT ph.Hostid
	,p.PlayerID
	,pn.FirstName
	,pn.LastName
	,p.SiteID
	,p.STATUS
	,p.BirthDay
	,p.DateEnrolled
	,p.Gender
	,pa.Line1
	,pa.Zipcode
	,pa.City
	,pa.STATE
	,pp.Phone
	,pp.Preferred
	,pp.AllowMessages
	,pe.Email
	,pe.DefaultEmail
	,d.PostalMailOptIn
	,d.EmailOptIn
	,d.TextMessagingOptIn
	,d.PhoneOptIn
FROM [HostViz_IGT_Patron].[dbo].[Player] AS p WITH (NOLOCK)
INNER JOIN HostViz_IGT_Patron.dbo.PlayerHost AS ph WITH (NOLOCK)
	ON ph.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerAddress] AS pa WITH (NOLOCK)
	ON pa.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerPhone] AS pp WITH (NOLOCK)
	ON pp.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerEmail] AS pe WITH (NOLOCK)
	ON pe.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[PlayerName] AS pn WITH (NOLOCK)
	ON pn.PlayerID = p.PlayerID
LEFT JOIN [HostViz_IGT_Patron].[dbo].[DirectMarketingPlayerConfig] AS d WITH (NOLOCK)
	ON d.playerid = p.playerid
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[VE_VW_HV_HotelReservations]
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
-- Author: David Shepherd
-- Date: 2017-07-04
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2017-07-04	1.0					David Shepherd			Initial version.
--=====================================================================================================
SELECT  [_ID]
      ,[Version]
      ,[PlayerID]
      ,[ArrivalDate]
      ,[DepartureDate]
      ,[TotalRooms]
      ,[TotalAdults]
      ,[TotalChildren]
      ,[RoomTypeRequest]
      ,[BedTypeRequest]
      ,[SmokingPreference]
      ,[CompNights]
      ,[BillingProfile]
      ,[CompNumber]
      ,[Notes]
      ,[Status]
      ,[ConfirmationNumber]
      ,[RequestedBy]
      ,[RequestDate]
      ,[ConfirmationDate]
	  ,[EmailFlag]
	  ,[ConfirmedBy]
	  ,[ActionType]
      ,[ModificationDate]
	  ,[Rate]
      ,[LimoPickUp]
      ,[LimoPickUpLocation]
      ,[LimoDestination]
      ,[LimoPickUpDate]
      ,[LimoPickUpTime]
      ,[LimoPickUpCellNumber]
  FROM [dbo].[VE_HV_HotelReservations] (nolock)






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VE_VW_HV_MosaicHost]
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
-- Author: Tonya Talbot
-- Date: 11/28/2016
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--=====================================================================================================
WITH Tasks_Completed
AS (
	SELECT
		--DISTINCT 
		CAST(CompletionDate AS DATE) AS CompletionDate
		,HostID
		,PlayerID
		,1 AS Completed_Tasks
	FROM VE_HV_Task
	WHERE CompletionDate IS NOT NULL
	GROUP BY CompletionDate
		,HostID
		,PlayerID
	)
	,Tasks_CompletedAgg
AS (
	SELECT CompletionDate
		,HostId
		,PlayerID
		,COUNT(Completed_Tasks) AS Completed_Tasks
	FROM Tasks_Completed
	GROUP BY CompletionDate
		,HostId
		,PlayerID
	)
	,Tasks_Due
AS (
	SELECT HOSTID
		,COUNT(CASE 
				WHEN CompletionDate IS NULL
					AND DueDate >= current_timestamp
					AND StartFromDate <= Current_timestamp
					THEN 1
				ELSE NULL
				END) AS TDue
	FROM VE_HV_Task
	GROUP BY HostID
	)
	,COMMS
AS (
	SELECT HostID
		,PlayerID
		,CreateDate
		,1 AS CommCount
	FROM VE_HV_COMMUNICATION
	)
	,COMMS_Agg
AS (
	SELECT DISTINCT CreateDate
		,HostID
		,PlayerID
		,SUM(CommCount) AS CommDaily
		,1 AS Unique_Comms
	FROM Comms
	GROUP BY CreateDate
		,HostID
		,PlayerID
	)
SELECT
	--*
	1 AS CorpLevel
	,ISNULL(Comms_Agg.HostID, Tasks_CompletedAgg.HostID) AS HostID
	,ISNULL(Comms_Agg.PlayerId, Tasks_CompletedAgg.PlayerID) AS PlayerID
	,ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate) AS InteractionDate
	,ISNULL(CommDaily, 0) AS CommTotal
	,ISNULL(Unique_Comms, 0) AS CommUnique
	,ISNULL(Completed_Tasks, 0) AS TasksCompleted
	,ISNULL(TDUE, 0) AS TasksDue
	,RIGHT(CAST(DATEPART(yy, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR), 4) AS YearLabel
	,'Q' + CAST(DATEPART(qq, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR) AS QuarterLabel
	,LEFT(CAST(DATENAME(mm, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR), 3) AS MonthLabel
	,CAST(DATEPART(dd, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR) AS DayofMonthLabel
	,CAST(DATEPART(WEEK, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR) AS WeekofYearLabel
	,CAST(DATENAME(dw, ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate)) AS VARCHAR) AS DayofWeekLabel
	,CASE 
		WHEN ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate) <= DATEADD(yy, - 1, Getdate())
			AND ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate) >= DATEADD(month, DATEDIFF(month, 0, Dateadd(yy
						, - 1, Getdate())), 0)
			THEN 1
		ELSE 0
		END AS PYMTDFlag
	,CASE 
		WHEN ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate) <= DATEADD(yy, - 1, Getdate())
			AND ISNULL(Comms_Agg.CreateDate, Tasks_CompletedAgg.CompletionDate) >= DATEADD(qq, DATEDIFF(qq, 0, Dateadd(yy, - 1, 
						Getdate())), 0)
			THEN 1
		ELSE 0
		END AS PYQTDFlag

FROM Comms_Agg
FULL OUTER JOIN Tasks_CompletedAgg
	ON Tasks_CompletedAgg.HostId = Comms_Agg.HostId
		AND Tasks_CompletedAgg.CompletionDate = Comms_agg.CreateDate
		AND Tasks_CompletedAgg.PlayerId = Comms_agg.PlayerID
LEFT JOIN Tasks_Due
	ON Tasks_Due.HostID = Comms_Agg.HostID



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_Preference]
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
-- Author: Ryan Kirby
-- Date: 2016-02-23
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2016-02-24	1.0					Ryan Kirby			Initial version.
-- 2017-05-19		2.1				Ryan Kirby			Formatting; Testing version control.
--=====================================================================================================
SELECT  [PreferenceID]
      ,[PlayerID]
      ,[PreferenceTypeID]
      ,[PreferenceDetail]
      ,[CreateDate]
      ,[VersionNum]
  FROM [HostViz_IGT_Template].[dbo].[VE_HV_PREFERENCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_Preference_HV02]
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
-- Author: David John Shepherd
-- Date: 16 March 2016
-- Version: 1.0
-- Notes: Created to allow preferences to be grouped by their Parent Key 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--20160630		1.0					Ryan Kirby			Initial commit
--=====================================================================================================

SELECT t1.PreferenceID
	,t1.PlayerID
	,t1.PreferenceTypeID
	,t1.PreferenceDetail
	,t1.CreateDate
	,t2.LookupValue AS Master_Type
	,t3.LookupValue AS Sub_Type
FROM (
	SELECT PreferenceID
		,PlayerID
		,PreferenceTypeID
		,PreferenceDetail
		,CreateDate
		,VE_HV_DROPDOWNVALUES.ParentKey
	FROM Hostviz_IGT_Template.dbo.VE_HV_PREFERENCE
	INNER JOIN VE_HV_DROPDOWNVALUES
		ON VE_HV_PREFERENCE.PreferenceTypeID = VE_HV_DROPDOWNVALUES.LookUpKey
	) AS T1
INNER JOIN (
	SELECT LookupValue
		,LookupKey
	FROM VE_HV_DROPDOWNVALUES
	WHERE PArentKey IS NULL
		OR parentkey LIKE ''
	) AS T2
	ON T1.ParentKey = T2.LookupKey
INNER JOIN (
	SELECT LookupValue
		,LookupKey
	FROM VE_HV_DROPDOWNVALUES
	WHERE LookupName LIKE 'Preferences'
	) AS T3
	ON T1.PreferenceTypeID = T3.LookupKey







;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VE_VW_HV_PREFERENCE_ParentLookup] AS

With DropdownLookup as(
 SELECT [RowId]
  ,[VersionNum]
  ,[LookupName]
  ,[LookupValue]
  ,[DefaultValue]
  ,[ParentKey]
  ,[Lookupkey]
 FROM [HostViz_IGT_Template].[dbo].[VE_HV_DROPDOWNVALUES]
 WHERE LookupName like 'Preferences'
)
SELECT  p.[PreferenceID]
 ,p.[PreferenceTypeID]
 ,[PreferenceDetail]
 ,DropdownLookup.[ParentKey]
 ,d.[LookupValue] as ParentDetail
FROM [HostViz_IGT_Template].[dbo].[VE_HV_PREFERENCE] as p
LEFT JOIN DropdownLookup ON DropdownLookup.LookUpkey = p.PreferenceTypeID
LEFT JOIN 
(
SELECT *
FROM [HostViz_IGT_Template].[dbo].[VE_HV_DROPDOWNVALUES]
 WHERE LookupName = 'Preferences' AND ParentKey IS NULL)
 d
 ON dropdownlookup.parentkey = d.LookupKey
;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_HV_Task]
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
-- Author: Ryan Kirby
-- Date: 2016-02-23
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2016-02-23	1.0					Ryan Kirby			Initial version.
--=====================================================================================================
SELECT [TaskID]
	,[HostID]
	,[PlayerID]
	,[ActionGenerationID]
	,[Type]
	,[Name]
	,[Description]
	,[DueDate]
	,[StartFromDate]
	,[ActualStartDate]
	,[CompletionDate]
	,[Notes]
	,[Priority]
	,[Status]
	,[DissolveDate]
	,[CreateDate]
	,[ModifiedDate]
	,[VersionNum]
FROM [dbo].[VE_HV_Task]


;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*	*
	* INTELLECTUAL PROPERTY NOTICE
	* Copyright (C) 2008 - 2016 NEW BIS SAFE LUXCO S.A.R.L
	*
	* The VizExplorer software code below is a component of a VizExplorer software solution.
	*
	* If the software code below is in non-source code executable form, then the code is
	* licensed to you on the terms and conditions of VizExplorer’s standard End User License
	* Agreement, a copy of which is located on VizExplorer’s website
	* at: http://www.vizexplorer.com/license-agreements/. By using the software code you
	* agree that you have read and accepted the terms and conditions of VizExplorer’s standard
	* End User License Agreement.
	*
	* If the software code below is in source code form, no license or other permission is
	* granted to you to use the software code.
	*
==========================================================================================
	Date		Vers.	Name				Comments
	2017-09-29	1.0		Initial Version		
========================================================================================== */
CREATE VIEW [dbo].[VE_VW_HV_UserProperties] AS
SELECT
	  [_ID]
	, [_Version]
	, [UserID]
	, [IndividualEmail]
	, [IsAvailableForTasks]
	, [LoginStatus]
	, [IsPreferredLogin]
	, [MapToUserID]
	, [UserPhone]
	, [UserGroupID]
	, [ParentKey]
	, [DefaultValue]
	, [LookupName]
	, [SiteID]
	, [IsUncoded]
FROM [GreetViz_template].[dbo].[VE_gv_UserProperties] WITH (NOLOCK)


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_Location] AS
SELECT
	LocationId
	, Name
	, XRef
	, Active
	, PitId
	, GameId
	, MinimumBet
	, MaximumBet
	, PlayerProfiling
	, ShoeCounting
	, AllowRim
	, LastShoeTime
	, ShoeTimeEquivalence
	, OpenStatus
	, GameDate
	, Shift
	, X
	, Y
	, Angle
	, LayoutId
	, TableNumber
	, BRSName
	, IsBRSOnline
	, TurnoverTally
	, NewShoeResult
	, HourlyUpdate
FROM
	HostViz_IGT_Patron.dbo.Location;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--=====================================================================================================
-- The following Intellectual Property Notice applies to all sofTheoWinare code below and replaces any
-- similar notice contained in this sofTheoWinare.
-- Intellectual Property Notice
-- Copyright (c) 2014 - NEW BIS SAFE LUXCO S.A.R.L. - All rights reserved.
-- The BIS2 sofTheoWinare code below is a component of BIS2's gameViz(tm) sofTheoWinare solution (which may include,
-- but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed -- to you as
-- a BIS2 customer or user subject to the terms and conditions of BIS2's standard End User License
-- Agreement a copy of which is located on BIS2's website at http://www.bis2.net/#!license-agreements/c21mq.
-- By using the code you agree that you have read and accepted the terms and conditions of the BIS2 standard
-- End User License Agreement.
--=====================================================================================================
-- Author: Jeffrey Mihalik
-- Date: December 7th, 2014
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--2014-12-07      1.0               Jeffrey Mihalik             Initial Version
--2014-12-08      1.1               Christopher West            Added Hackjoin 
--=====================================================================================================
CREATE VIEW [dbo].[VE_VW_Mosaic_DailyPlayer]
AS
SELECT 1 AS HackJoin
	,PlayerID
	,SiteID
	,AccountingDate
	--Type,
	,[Slot_TimePlayed] + [Table_TimePlayed] AS TimePlayed
	,[Slot_CoinIn] + [Table_ChipsIn] AS CoinIn
	,[Slot_CoinOut] + [Table_ChipsOut] AS CoinOut
	,[Slot_Games] + [Table_Games] AS Games
	,[Slot_Jackpot] AS Jackpot
	,[Slot_CoinIn] - [Slot_CoinOut] + [Table_Win] AS Win
	,[Slot_TheoWin] + [Table_TheoWin] AS TheoWin
	,[Slot_CompEarned] + [Table_CompEarned] as CompEarned
	,[Slot_XC_Used] AS FreePlay
	,[Slot_XC_PPEarned] AS PointPlay
	,[Slot_XC_BSEarned] AS BonusPlay
	,[Slot_BillsIn] AS BillsIn
	,[Slot_TheoWin] + [Table_TheoWin] - [Slot_XC_Used] AS NetTheoWin
	,[Slot_CoinIn] - [Slot_CoinOut] + [Table_Win] - [Slot_XC_Used] AS NetActualWin
FROM [HostViz_IGT_Patron].[dbo].[PlayerDay]
	--FROM	HostViz_IGT_Template.dbo.BIS2_Daily_Player

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VE_VW_Mosaic_PlayerHost]
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
-- Author: Jeffrey Mihalik
-- Date: 24 October 2013
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
--=====================================================================================================
SELECT PlayerID
	,SiteID
	,HostID
FROM HostViz_IGT_Patron.dbo.PlayerHost WITH (NOLOCK)
Where HostID <> 25

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VE_VW_Mosaic_Site]
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
-- Author: Jeffrey Mihalik
-- Date: 24 October 2013
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
--
--===================================================================================================== 
  SELECT [SiteID]
      ,[SiteName]
  FROM [HostViz_IGT_Template].[dbo].[VE_HV_Site] WITH (NOLOCK)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VE_VW_Patron] AS
SELECT
	AccountId
	, Active
	, PatronId
	, SiteId
	, RegistrationDate
	, FirstName
	, MiddleName
	, LastName
	, Prefix
	, Suffix
	, Generation
	, RankId
	, SSN
	, DOB
	, Anniversary
	, Sex
	, Race
	, Height
	, Build
	, Hair
	, Eyes
	, Age
	, Description
	, LastPlayDate
	, CTRStatus
	, CTRCount
	, CTRDate
	, CashDeposit
	, CreditLimit
	, CreditAvailable
	, TTO
	, InTransitCredit
	, CreditOnHold
	, CreditStatus
	, LastMarkerDate
	, IssueMarker
	, RedeemMarker
	, PointBalance
	, CompValue
	, CasinoHostId
	, HotelGuest
	, Refused
	, Verified
	, Discreet
	, DetailsPurged
	, ForcePending
FROM
	HostViz_IGT_Patron.dbo.Patron;
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [NCLX_CompletionDate_Status_DissolveDate] ON [dbo].[VE_HV_Task]
(
	[CompletionDate] ASC,
	[Status] ASC,
	[DissolveDate] ASC
)
INCLUDE ( 	[HostID],
	[Priority]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VE_HV_ACTION_FACTORY_TEMPLATE] ADD  DEFAULT ('default') FOR [AssignHostBehavior]
GO
ALTER TABLE [dbo].[VE_HV_ACTION_FACTORY_TEMPLATE] ADD  DEFAULT ('specific') FOR [AssignHostBehaviorOverflow]
GO
ALTER TABLE [dbo].[VE_HV_ApplicationPreferences] ADD  CONSTRAINT [DF_VE_HV_ApplicationPreferences$_ID]  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_HV_ApplicationPreferences] ADD  CONSTRAINT [DF_VE_HV_ApplicationPreferences$_Version]  DEFAULT ((1)) FOR [_Version]
GO
ALTER TABLE [dbo].[VE_HV_ApplicationPreferences] ADD  CONSTRAINT [DF_VE_HV_ApplicationPreferences$SiteID]  DEFAULT ((1)) FOR [SiteID]
GO
ALTER TABLE [dbo].[VE_HV_AutoTaskGeneration] ADD  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_HV_AutoTaskGeneration] ADD  DEFAULT ((0)) FOR [Version]
GO
ALTER TABLE [dbo].[VE_HV_AutoTaskLookup_20170801] ADD  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_HV_AutoTaskLookup_20170801] ADD  DEFAULT ((0)) FOR [Version]
GO
ALTER TABLE [dbo].[VE_HV_COMMUNICATION] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[VE_HV_CompException] ADD  DEFAULT ((0)) FOR [Version]
GO
ALTER TABLE [dbo].[VE_HV_CompException] ADD  DEFAULT ('New') FOR [Status]
GO
ALTER TABLE [dbo].[VE_HV_CompException] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT (newid()) FOR [VIPid]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ('1970-01-01') FOR [StartDate]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ('2100-01-01') FOR [EndDate]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ((1)) FOR [VersionNum]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ('VIP') FOR [Department]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ((1)) FOR [HostID]
GO
ALTER TABLE [dbo].[VE_HV_HostList] ADD  DEFAULT ('A5') FOR [GoalRating]
GO
ALTER TABLE [dbo].[VE_HV_HotelLookup] ADD  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_HV_HotelLookup] ADD  DEFAULT ((0)) FOR [Version]
GO
ALTER TABLE [dbo].[VE_HV_HotelReservations] ADD  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_HV_HotelReservations] ADD  DEFAULT ((0)) FOR [Version]
GO
ALTER TABLE [dbo].[VE_HV_HotelReservations] ADD  DEFAULT ('New') FOR [Status]
GO
ALTER TABLE [dbo].[VE_HV_HotelReservations] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[VE_HV_Player_Alerts] ADD  CONSTRAINT [DF_VE_HV_Player_Alerts$_ID]  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_HV_Player_Alerts] ADD  CONSTRAINT [DF_VE_HV_Player_Alerts$_Version]  DEFAULT ((0)) FOR [_Version]
GO
ALTER TABLE [dbo].[VE_HV_Player_Alerts] ADD  CONSTRAINT [DF_VE_HV_Player_Alerts$CreateDtm]  DEFAULT (getdate()) FOR [CreateDtm]
GO
ALTER TABLE [dbo].[VE_HV_Player_Alerts] ADD  CONSTRAINT [DF_VE_HV_Player_Alerts$Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[VE_HV_Task] ADD  CONSTRAINT [DF__BIS2_HV_T__Statu__173876EA]  DEFAULT ('unactioned') FOR [Status]
GO
ALTER TABLE [dbo].[VE_tv_SubscribedEvents] ADD  CONSTRAINT [DF__VE_tv_Subsc___ID__4F1DA8B1]  DEFAULT (newid()) FOR [_ID]
GO
ALTER TABLE [dbo].[VE_tv_SubscribedEvents] ADD  CONSTRAINT [DF__VE_tv_Sub___Vers__5011CCEA]  DEFAULT ((0)) FOR [_Version]
GO
ALTER TABLE [dbo].[VE_tv_SubscribedEvents] ADD  CONSTRAINT [DF__VE_tv_Sub__Gamin__5105F123]  DEFAULT ((-1)) FOR [GamingSystemCode1]
GO
ALTER TABLE [dbo].[VE_tv_SubscribedEvents] ADD  CONSTRAINT [DF__VE_tv_Sub__Gamin__51FA155C]  DEFAULT ((-1)) FOR [GamingSystemCode2]
GO
ALTER TABLE [dbo].[VE_tv_SubscribedEvents] ADD  CONSTRAINT [DF__VE_tv_Sub__IsSub__52EE3995]  DEFAULT ((1)) FOR [IsSubscribed]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
-- Author: Ryan Kirby
-- Date: 2016-06-21
-- Version: 1.0
-- Notes: 
--=====================================================================================================
--  DATE    |       VERSION     |       CHANGED BY      |                   COMMENTS
--=====================================================================================================
-- 2016-06-21		1.0				Ryan Kirby				Initial commit.
--=====================================================================================================
CREATE PROCEDURE [dbo].[BIS2_SP_HV_Materialize_LastTrip]
AS
BEGIN
	SET NOCOUNT ON;

	TRUNCATE TABLE [HostViz_IGT_Template].[dbo].[VE_HV_LastTrip];

	INSERT INTO [HostViz_IGT_Template].[dbo].[VE_HV_LastTrip] (
		[PlayerID]
		,[LastTrip]
		,[TripsOwed]
		,[DaysSinceLastTrip]
		)
	SELECT [PlayerID]
		,[LastTrip]
		,[TripsOwed]
		,[DaysSinceLastTrip]
	FROM [HostViz_IGT_Template].[dbo].[VE_VW_HV_LastTrip_live]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_BIS2_generate_player_onfloor_transaction]
	@enddate datetime
AS
BEGIN
	IF @enddate IS NULL
	BEGIN
		SET @enddate = GETDATE()
	END

	INSERT INTO [dbo].[BIS2_T_PlayerSession_CurrentOnFloor_Demo]
	SELECT y.[PlayerID]
		,y.[mnum]
		,y.[SiteID]
		,dateadd(ss, 10 * RAND(CAST(NEWID() AS VARBINARY)), @enddate) AS [EndTime]
		,dateadd(ss, 10 * RAND(CAST(NEWID() AS VARBINARY)), dateadd(ss, - y.timeplayed, @enddate)) AS [StartTime]
		,y.[TimePlayed]
		,y.[Location]
		,y.[CoinIn]
		,y.[CoinOut]
		,y.[Games]
		,y.[Jackpot]
		,y.[BillsIn]
		,y.[AverageBet]
		,y.[Win]
		,y.[TheoWin]
		,y.[CompEarned]
		,y.[Type]
		,y.[XC_Used]
		,y.[PointsEarned]
		,y.[PointMultiplier]
		,y.[AccountingDate]
	FROM (
		SELECT *
		FROM (
			SELECT playerid
			--FROM [dbo].[PlayerHost_CurrentOnFloor_Demo]
			FROM BIS2_VW_HV_PlayerHost
		
			--UNION ALL
		
			--SELECT playerid
			--FROM [dbo].[PlayerNoHost_CurrentOnFloor_Demo]
			) AS playerhost
		WHERE (ABS(CAST((BINARY_CHECKSUM(*) * RAND()) AS INT)) % 100) < 3
		) x
	INNER JOIN (
		SELECT [PlayerID]
			,[mnum]
			,[SiteID]
			,[EndTime]
			,[StartTime]
			,[TimePlayed]
			,[Location]
			,[CoinIn]
			,[CoinOut]
			,[Games]
			,[Jackpot]
			,[BillsIn]
			,[AverageBet]
			,[Win]
			,[TheoWin]
			,[CompEarned]
			,[Type]
			,[XC_Used]
			,[PointsEarned]
			,[PointMultiplier]
			,[AccountingDate]
		FROM (
			SELECT *
				,row_number() OVER (
					PARTITION BY playerid ORDER BY endtime DESC
					) AS rownum
			FROM [BIS2_T_PlayerSession_CurrentOnFloor_Demo]
			WHERE endtime < '2016-04-15'
				AND (ABS(CAST((BINARY_CHECKSUM(*) * RAND()) AS INT)) % 100) < 10
			) yy
		WHERE rownum = 1
		) y
		ON x.playerid = y.playerid
	WHERE dateadd(ss, timeplayed, (
				SELECT max(endtime)
				FROM [BIS2_T_PlayerSession_CurrentOnFloor_Demo]
				WHERE playerid = x.playerid
				)) <= @enddate

	UPDATE [BIS2_T_PlayerSession_CurrentOnFloor_Demo]
	SET AccountingDate = cast(dateadd(hh,-3, endtime) as date)
	WHERE endtime >= dateadd(hh, -2, @enddate)
END







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

CREATE TRIGGER [dbo].[trg_BIS2_Template_Delete]
ON  [dbo].[VE_HV_ACTION_FACTORY_TEMPLATE] 
AFTER Delete
AS 

/*==================================================================================================================================
   The following Intellectual Property Notice applies to all software code below and replaces any
   similar notice contained in this software.
   Intellectual Property Notice
    
   Copyright (c) 2014 -  NEW BIS SAFE LUXCO S.A.R.L - All rights reserved.
  
   The VizExplorer code below is a component of VizExplorer's gameViz(tm) software solution (which may 
   include, but is not limited to, gameViz(tm) modules floorViz(tm) and aimViz(tm)) and is licensed to 
   you as a VizExplorer customer or user subject to the terms and conditions of VizExplorer's standard 
   End User License Agreement a copy of which is located on VizExplorer's website at 
   http://www.vizexplorer.com/license-agreements/ 
   By using the code you agree that you have read and accepted the terms and conditions of the 
   VizExplorer standard End User License Agreement.
=====================================================================================================
	26 January 2015		Judy Schroeder		Deletes task template and associated segments and tasks
	26 March 2015		Glenn Benge 		removed delete from BIS2_VE_ACTION_FACTORY_TEMPLATE

=====================================================================================================*/

	DECLARE @ActionTemplateID	varchar(36)
		,	@ActionGenerationID varchar(36)
		
	SELECT @actionTemplateID = deleted.ActionTemplateID FROM Deleted	
	--LEFT JOIN BIS2_VE_ACTION_FACTORY_TEMPLATE t on d.ActionTemplateID = t.ActionTemplateID
	--WHERE t.ActionTemplateID is null	
	
	DELETE FROM dbo.BIS2_MT_HV_ACTION_TEMPLATE_SEGMENT WHERE ActionTemplateID = @ActionTemplateID
	
	DECLARE curAction CURSOR FOR
			SELECT ActionGenerationID FROM BIS2_MT_HV_ACTION_GENERATION WHERE ActionTemplateID = @ActionTemplateID;
			
			OPEN curAction;
			FETCH NEXT FROM curAction INTO @ActionGenerationID;
			WHILE @@FETCH_STATUS = 0
				BEGIN
					Update dbo.BIS2_MT_HV_TASK 
					Set Status = 'Unassigned'
					WHERE ActionGenerationID = @ActionGenerationID AND Not Status = 'Closed'					
				FETCH NEXT FROM curAction INTO @ActionGenerationID;
				END;
			CLOSE curAction;
			DEALLOCATE curAction;



GO
ALTER TABLE [dbo].[VE_HV_ACTION_FACTORY_TEMPLATE] ENABLE TRIGGER [trg_BIS2_Template_Delete]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE TRIGGER [dbo].[bis2_trg_hv_template_segment_del_trg] ON [dbo].[VE_HV_ACTION_TEMPLATE_SEGMENT]
AFTER DELETE
AS
--
-- The following Intellectual Property Notice applies to all software code below
-- and replaces any similar notice contained in this software.
-- Intellectual Property Notice
--
-- (c) 2015 Business Intelligence Systems Solutions Holdings B.V. - All rights reserved.
--
-- The BIS2 software code below is a component of Business Intelligence Systems Solutions, Inc.’s
-- gameViz(TM) software product (which may include, but is not limited to, gameViz(TM) modules floorViz(TM)
-- and aimViz(TM)) and is licensed to you as a BIS2 customer or user subject to the terms and
-- conditions of BIS2's standard End User License Agreement a copy of which is located on BIS2's website
-- www.vizexplorer.com.  By using the code you agree that you have read and accepted the terms and conditions of
-- BIS2 standard End User License Agreement.
--
-- v. 20150422-01/v5  Alexey Maksimov  Fixed join condition to avoid removal
--                                     of extra records
BEGIN
	UPDATE BIS2_MT_HV_TASK
	SET STATUS = 'Unassigned'
	FROM BIS2_MT_HV_TASK t
	INNER JOIN BIS2_MT_HV_ACTION_GENERATION ag
		ON ag.actiongenerationid = t.actiongenerationid
	INNER JOIN DELETED d
		ON d.ActionTemplateID = ag.ActionTemplateID
			AND d.SegmentID = ag.SegmentID
	WHERE NOT t.STATUS = 'Closed'
		AND NOT t.STATUS = 'Unassigned'
END;


GO
ALTER TABLE [dbo].[VE_HV_ACTION_TEMPLATE_SEGMENT] ENABLE TRIGGER [bis2_trg_hv_template_segment_del_trg]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Highlight and execute the following statement to drop the trigger
before executing the create statement.

DROP TRIGGER dbo.bis2_trg_hv_template_segment_ins_trg;

*/


CREATE TRIGGER [dbo].[bis2_trg_hv_template_segment_ins_trg]
  ON [dbo].[VE_HV_ACTION_TEMPLATE_SEGMENT]
  AFTER INSERT
AS
--
-- The following Intellectual Property Notice applies to all software code below
-- and replaces any similar notice contained in this software.

-- Intellectual Property Notice
--
-- (c) 2015 Business Intelligence Systems Solutions Holdings B.V. - All rights reserved.
--
-- The BIS2 software code below is a component of Business Intelligence Systems Solutions, Inc.’s
-- gameViz(TM) software product (which may include, but is not limited to, gameViz(TM) modules floorViz(TM)
-- and aimViz(TM)) and is licensed to you as a BIS2 customer or user subject to the terms and
-- conditions of BIS2's standard End User License Agreement a copy of which is located on BIS2's website
-- www.vizexplorer.com.  By using the code you agree that you have read and accepted the terms and conditions of
-- BIS2 standard End User License Agreement.
--
-- 20150330-01 (v2) Alexey Maksimov

BEGIN

  DECLARE @ActionGenerationID VARCHAR(36)

  DECLARE @ActionTemplateID VARCHAR(36)
  DECLARE @SegmentID VARCHAR(36)

  -- Loading date into a variable so all the INSERT's look atomic
  DECLARE @CurDate DATETIME
  SET @CurDate = GETDATE()

  DECLARE inserted_cur CURSOR
    FOR SELECT ActionTemplateID, SegmentID FROM inserted;

  DECLARE @HostCount BIGINT;

  OPEN inserted_cur;

  WHILE 1 = 1 BEGIN

    FETCH NEXT FROM inserted_cur INTO @ActionTemplateID, @SegmentID;

    IF (@@FETCH_STATUS <> 0) BREAK;

    SET @ActionGenerationID = NEWID();

    BEGIN TRANSACTION;
 
    -- store details of generation (action factory) process in a new BIS2_MT_HV_ACTION_GENERATION row
    -- Cartesian product of 1 row from BIS2_VE_ACTION_FACTORY_TEMPLATE x 1 row from BIS2_hv_segment
  	
    INSERT INTO BIS2_MT_HV_ACTION_GENERATION (
      ActionGenerationID, UsernameLastModified, ActionTemplateID, GenerateType,Name,
      GenerateSubType, Description, Priority, StartFromDate, DueDate,
      AssignHostBehavior, /*AssignHostBehaviorOverflow,*/ HostIDAssign,
      /*HostIDAssignOverflow,*/ TriggerEventType, TriggerEventSubType, SegmentID,
      SegmentName, SegmentType, SourceActionReason, CreateDate, VersionNum
    )
    SELECT
      DISTINCT @ActionGenerationID, Template.UsernameLastModified, Template.ActionTemplateID, Template.GenerateType,Template.Name,
      Template.GenerateSubType, Template.Description, Template.Priority, Template.StartFromDate, Template.DueDate,
      Template.AssignHostBehavior, /*Template.AssignHostBehaviorOverflow,*/ Template.HostIDAssign,
      /*Template.HostIDAssignOverflow,*/ Template.TriggerEventType, Template.TriggerEventSubType, Segment.SegmentID,
      Segment.Name, Segment.Type, 'template-segment ins trig', @CurDate, 1
    FROM
      (SELECT * FROM BIS2_MT_HV_SEGMENT WHERE SegmentID = @SegmentID) AS Segment
      CROSS JOIN (
        SELECT * FROM BIS2_MT_HV_VE_ACTION_FACTORY_TEMPLATE
        WHERE ActionTemplateID = @ActionTemplateID
          AND (DissolveDate IS NULL OR DissolveDate > @CurDate)
      ) AS Template
  	
    -- 0 rows = inconsistent data (missing BIS2_hv_segment or BIS2_VE_ACTION_FACTORY_TEMPLATE record)
    -- > 1 rows = inconsistent data (whatever should be unique is not)
    
    IF @@ROWCOUNT = 1 BEGIN

      -- Manual override of JOIN-with-analytic-function-and-percent-bug

      DECLARE @v_PlayerID int;
      DECLARE @v_HostID varchar(50);
      DECLARE @v_AssignHostBehavior varchar(12);
      -- DECLARE @v_AssignHostBehaviorOverflow varchar(12);
      DECLARE @v_HostIDAssign varchar(36);
      -- DECLARE @v_HostIDAssignOverflow varchar(36);
      DECLARE @v_Type varchar(20);
      DECLARE @v_Description varchar(120);
      DECLARE @v_DueDate datetime;
      DECLARE @v_StartFromDate datetime;
      DECLARE @v_Priority smallint;
      DECLARE @v_DissolveDate datetime;
      DECLARE @v_Name varchar(25);


      DECLARE users_cur CURSOR FOR
        SELECT
          SegmentPlayerHost.PlayerID, SegmentPlayerHost.HostID,
          Tmpl.AssignHostBehavior, /*Tmpl.AssignHostBehaviorOverflow,*/ Tmpl.HostIDAssign, /*Tmpl.HostIDAssignOverflow,*/ Tmpl.Name,
          Tmpl.GenerateSubType AS Type, Tmpl.Description, Tmpl.DueDate, Tmpl.StartFromDate, Tmpl.Priority,
          Tmpl.DissolveDate
        FROM
          (
            SELECT * FROM BIS2_MT_HV_VE_ACTION_FACTORY_TEMPLATE
              WHERE ActionTemplateID = @ActionTemplateID
                AND (DissolveDate IS NULL OR DissolveDate > @CurDate)
          ) AS Tmpl
          CROSS JOIN (
            SELECT b2ps.PlayerID, b2ph.HostID
              FROM BIS2_MT_HV_PLAYER_SEGMENT as b2ps
                LEFT JOIN BIS2_VW_HV_PlayerHost as b2ph
                  ON b2ps.PlayerID = b2ph.PlayerID
              WHERE b2ps.SegmentID = @SegmentID
          ) AS SegmentPlayerHost
        ORDER BY ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT));

      DECLARE @v_GenHostID varchar(50);
      DECLARE @v_EndOfHostsListReached int;
      SET @v_EndOfHostsListReached = 0;

      -- Data source for randomized host list
      DECLARE hosts_cur CURSOR FOR
        SELECT HostID
        FROM BIS2_MT_HV_VIP_HOST -- BIS2_VW_Hosts
        ORDER BY ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT));

      OPEN users_cur;
      OPEN hosts_cur;

      WHILE 1 = 1 BEGIN

        FETCH NEXT FROM users_cur INTO
          @v_PlayerID, @v_HostID, @v_AssignHostBehavior, /*@v_AssignHostBehaviorOverflow,*/
          @v_HostIDAssign, @v_Name,
           /*@v_HostIDAssignOverflow,*/ @v_Type, @v_Description, @v_DueDate,
          @v_StartFromDate, @v_Priority, @v_DissolveDate;

        IF (@@FETCH_STATUS <> 0) BREAK;

        IF @v_EndOfHostsListReached > 0
          SET @v_GenHostID = NULL
        ELSE BEGIN
          FETCH NEXT FROM hosts_cur INTO @v_GenHostID;
          IF (@@FETCH_STATUS <> 0) BEGIN
            CLOSE hosts_cur;
            OPEN hosts_cur;
            FETCH NEXT FROM hosts_cur INTO @v_GenHostID;
            IF (@@FETCH_STATUS <> 0) BEGIN
              SET @v_EndOfHostsListReached = 1;
              SET @v_GenHostID = NULL
            END;
          END;
        END;

        INSERT INTO BIS2_MT_HV_TASK (
          TaskID, PlayerID,
          HostID,
          ActionGenerationID, Type, Description,Name,
          DueDate, StartFromDate, Priority,
          Status, DissolveDate,
          CreateDate, ModifiedDate, VersionNum
        ) VALUES (
          NEWID(), @v_PlayerID,
          -- CASE
          -- WHEN @v_HostID IS NOT NULL THEN                                   -- for hosted
            CASE
              WHEN @v_AssignHostBehavior = 'specific' THEN @v_HostIDAssign  -- specific = Host defined in the template
              WHEN @v_AssignHostBehavior = 'random' THEN @v_GenHostID       -- random = Random amongst all hosts
              ELSE COALESCE(@v_HostID, @v_GenHostID)                        -- default/unimplemented = Player's host
            END
          -- ELSE
          --   CASE                                                            -- for unhosted
          --     WHEN @v_AssignHostBehaviorOverflow = 'specific' THEN          -- specific = Host defined in the template
          --       @v_HostIDAssignOverflow
          --     WHEN @v_AssignHostBehaviorOverflow = 'random' THEN            -- random = Random amongst all hosts
          --       @v_GenHostID
          --     ELSE NULL                                                     -- default/unimplemented = NULL
          --   END
          -- END
          , @ActionGenerationID, @v_Type, @v_Description,@v_Name,
          @v_DueDate, @v_StartFromDate, @v_Priority,
          'unactioned', @v_DissolveDate,
          @CurDate, @CurDate, 1
        );

      END;

      CLOSE users_cur;
      DEALLOCATE users_cur;
      CLOSE hosts_cur;
      DEALLOCATE hosts_cur;

    END;

    COMMIT;

  END;

  CLOSE inserted_cur;
  DEALLOCATE inserted_cur;

END;
GO
ALTER TABLE [dbo].[VE_HV_ACTION_TEMPLATE_SEGMENT] ENABLE TRIGGER [bis2_trg_hv_template_segment_ins_trg]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE TRIGGER [dbo].[bis2_trg_hv_player_segment_del_trg]
  ON [dbo].[VE_HV_PLAYER_SEGMENT]
  AFTER DELETE AS
  -- v. 20150422-01/v5  Alexey Maksimov  Fixed join condition to avoid removal
  --                                     of extra records
  BEGIN
    --delete from BIS2_HV_TASK
    UPDATE BIS2_MT_HV_TASK
      SET Status = 'Unassigned'
      WHERE BIS2_MT_HV_TASK.TaskID IN (
        SELECT task.TaskID
          FROM DELETED AS d
            INNER JOIN BIS2_MT_HV_ACTION_GENERATION AS Gen
              ON d.SegmentID = Gen.SegmentID
            INNER JOIN BIS2_MT_HV_TASK as task 
              ON Gen.ActionGenerationID = task.ActionGenerationID
          WHERE task.PlayerID = d.PlayerID
      )
      AND NOT Status = 'Closed' AND NOT Status = 'Unassigned';
  END;



GO
ALTER TABLE [dbo].[VE_HV_PLAYER_SEGMENT] ENABLE TRIGGER [bis2_trg_hv_player_segment_del_trg]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[bis2_trg_hv_player_segment_ins_trg]
ON [dbo].[VE_HV_PLAYER_SEGMENT]
  AFTER INSERT
AS
--
-- The following Intellectual Property Notice applies to all software code below
-- and replaces any similar notice contained in this software.

-- Intellectual Property Notice
--
-- (c) 2015 Business Intelligence Systems Solutions Holdings B.V. - All rights reserved.
--
-- The BIS2 software code below is a component of Business Intelligence Systems Solutions, Inc.’s
-- gameViz(TM) software product (which may include, but is not limited to, gameViz(TM) modules floorViz(TM)
-- and aimViz(TM)) and is licensed to you as a BIS2 customer or user subject to the terms and
-- conditions of BIS2's standard End User License Agreement a copy of which is located on BIS2's website
-- www.vizexplorer.com.  By using the code you agree that you have read and accepted the terms and conditions of
-- BIS2 standard End User License Agreement.
--
-- 20150330-01/v2  Alexey Maksimov


BEGIN

  DECLARE @ActionGenerationID VARCHAR(36);
  -- in MS SQL Server use NEWID()
  -- in Oracle use SYS.STANDARD.TO_CHAR( SYS_GUID() )
  -- in MySQL use UUID()
  -- in DB2 use GENERATE_UNIQUE()
  -- PostgreSQL requires the uuid contrib extension to be loaded, then
  -- CAST(uuid_generate_v1() as varchar(36) OR (cheat)
  -- SELECT uuid_in(md5(random()::text || now()::text)::cstring)

  DECLARE @PlayerID int;
  DECLARE @SegmentID VARCHAR(36);

  -- Loading date into a variable so all the INSERT's look atomic
  DECLARE @CurDate DATETIME;
  SET @CurDate = GETDATE();

  DECLARE @v_l_UsernameLastModified varchar(25);
  DECLARE @v_l_ActionTemplateID varchar(36);
  DECLARE @v_l_GenerateType varchar(15);
  DECLARE @v_l_GenerateSubType varchar(20);
  DECLARE @v_l_Description varchar(120);
  DECLARE @v_l_Priority smallint;
  DECLARE @v_l_StartFromDate datetime;
  DECLARE @v_l_DueDate datetime;
  DECLARE @v_l_AssignHostBehavior varchar(12);
  DECLARE @v_l_HostIDAssign varchar(36);
  DECLARE @v_l_TriggerEventType varchar(15);
  DECLARE @v_l_TriggerEventSubType varchar(20);
  DECLARE @v_l_SegName varchar(30);
  DECLARE @v_l_SegType varchar(15);
  DECLARE @v_l_Name varchar(25);
  
  DECLARE inserted_cur CURSOR FOR
    SELECT
      DISTINCT Template.UsernameLastModified, Template.ActionTemplateID, Template.GenerateType,Template.Name,
      Template.GenerateSubType, Template.Description, Template.Priority, Template.StartFromDate, Template.DueDate,
      Template.AssignHostBehavior, Template.HostIDAssign,
      Template.TriggerEventType, Template.TriggerEventSubType, Segment.SegmentID,
      Segment.Name, Segment.Type, i.PlayerID
    FROM
      inserted AS i
      INNER JOIN BIS2_MT_hv_segment AS Segment ON Segment.SegmentID = i.SegmentID
      INNER JOIN BIS2_MT_HV_ACTION_TEMPLATE_SEGMENT AS ats ON ats.SegmentID = i.SegmentID
      INNER JOIN BIS2_MT_HV_VE_ACTION_FACTORY_TEMPLATE AS Template ON ats.ActionTemplateID = Template.ActionTemplateID
    WHERE (Template.DissolveDate IS NULL OR Template.DissolveDate > @CurDate);

  DECLARE @HostCount BIGINT;

  OPEN inserted_cur;

  WHILE 1 = 1 BEGIN

    FETCH NEXT FROM inserted_cur INTO
      @v_l_UsernameLastModified, @v_l_ActionTemplateID, @v_l_GenerateType,@v_l_Name,
      @v_l_GenerateSubType, @v_l_Description, @v_l_Priority, @v_l_StartFromDate, @v_l_DueDate,
      @v_l_AssignHostBehavior, @v_l_HostIDAssign,
      @v_l_TriggerEventType, @v_l_TriggerEventSubType, @SegmentID,
      @v_l_SegName, @v_l_SegType, @PlayerID;

    IF (@@FETCH_STATUS <> 0) BREAK;

    SET @ActionGenerationID = NEWID();

    -- store details of generation (action factory) process in a new BIS2_MT_HV_ACTION_GENERATION row
    -- Cartesian product of 1 row from BIS2_MT_HV_VE_ACTION_FACTORY_TEMPLATE x 1 row from BIS2_MT_hv_segment
  	
    INSERT INTO BIS2_MT_HV_ACTION_GENERATION (
      ActionGenerationID, UsernameLastModified, ActionTemplateID, GenerateType, Name,
      GenerateSubType, Description, Priority, StartFromDate, DueDate,
      AssignHostBehavior, HostIDAssign,
      TriggerEventType, TriggerEventSubType, SegmentID,
      SegmentName, SegmentType, SourceActionReason, CreateDate, VersionNum
    )
    VALUES (
      @ActionGenerationID, @v_l_UsernameLastModified, @v_l_ActionTemplateID, @v_l_GenerateType,@v_l_Name,
      @v_l_GenerateSubType, @v_l_Description, @v_l_Priority, @v_l_StartFromDate, @v_l_DueDate,
      @v_l_AssignHostBehavior, @v_l_HostIDAssign,
      @v_l_TriggerEventType, @v_l_TriggerEventSubType, @SegmentID,
      @v_l_SegName, @v_l_SegType, 'player-segment ins trig', @CurDate, 1
    );

    BEGIN

      BEGIN TRANSACTION;

      -- Manual override of JOIN-with-analytic-function-and-percent-bug

      DECLARE @v_PlayerID int;
      DECLARE @v_HostID varchar(50);
      DECLARE @v_AssignHostBehavior varchar(12);
      DECLARE @v_HostIDAssign varchar(36);
      DECLARE @v_Type varchar(20);
      DECLARE @v_Description varchar(120);
      DECLARE @v_DueDate datetime;
      DECLARE @v_StartFromDate datetime;
      DECLARE @v_Priority smallint;
      DECLARE @v_DissolveDate datetime;
  	  DECLARE @v_Name varchar(25);

      DECLARE users_cur CURSOR FOR
        SELECT
          SegmentPlayerHost.PlayerID, SegmentPlayerHost.HostID,
          Tmpl.AssignHostBehavior, Tmpl.HostIDAssign,Tmpl.Name,
          Tmpl.GenerateSubType AS Type, Tmpl.Description, Tmpl.DueDate, Tmpl.StartFromDate, Tmpl.Priority,
          Tmpl.DissolveDate
        FROM
          (
            SELECT * FROM BIS2_MT_HV_VE_ACTION_FACTORY_TEMPLATE
              WHERE ActionTemplateID = @v_l_ActionTemplateID
          ) AS Tmpl
          CROSS JOIN (
            SELECT b2ps.PlayerID, b2ph.HostID
              FROM BIS2_MT_hv_player_segment as b2ps
                LEFT JOIN BIS2_VW_HV_PlayerHost as b2ph
                  ON b2ps.PlayerID = b2ph.PlayerID
              WHERE b2ps.SegmentID = @SegmentID AND b2ps.PlayerID = @PlayerID
          ) AS SegmentPlayerHost
        ORDER BY ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT));

      DECLARE @v_GenHostID varchar(50);
      DECLARE @v_EndOfHostsListReached int;
      SET @v_EndOfHostsListReached = 0;

      -- Data source for randomized host list
      DECLARE hosts_cur CURSOR FOR
        SELECT HostID
        FROM BIS2_MT_HV_VIP_Host -- BIS2_VW_Hosts
        ORDER BY ABS(CAST(CAST(NEWID() AS VARBINARY) AS INT));

      OPEN users_cur;
      OPEN hosts_cur;

      WHILE 1 = 1 BEGIN

        FETCH NEXT FROM users_cur INTO
          @v_PlayerID, @v_HostID, @v_AssignHostBehavior, /*@v_AssignHostBehaviorOverflow,*/ 
          @v_HostIDAssign, @v_Name,
          /*@v_HostIDAssignOverflow,*/ @v_Type, @v_Description, @v_DueDate,
          @v_StartFromDate, @v_Priority, @v_DissolveDate;

        IF (@@FETCH_STATUS <> 0) BREAK;

        IF @v_EndOfHostsListReached > 0
          SET @v_GenHostID = NULL
        ELSE BEGIN
          FETCH NEXT FROM hosts_cur INTO @v_GenHostID;
          IF (@@FETCH_STATUS <> 0) BEGIN
            CLOSE hosts_cur;
            OPEN hosts_cur;
            FETCH NEXT FROM hosts_cur INTO @v_GenHostID;
            IF (@@FETCH_STATUS <> 0) BEGIN
              SET @v_EndOfHostsListReached = 1;
              SET @v_GenHostID = NULL
            END;
          END;
        END;

        INSERT INTO BIS2_MT_HV_TASK (
          TaskID, PlayerID,
          HostID,
          ActionGenerationID, Type, Description, Name,
          DueDate, StartFromDate, Priority,
          Status, DissolveDate,
          CreateDate, ModifiedDate, VersionNum
        ) VALUES (
          NEWID(), @v_PlayerID,
          --@v_GenHostID
          -- CASE
          -- WHEN @v_HostID IS NOT NULL THEN                                   -- for hosted
            CASE
              WHEN @v_AssignHostBehavior = 'specific' THEN @v_HostIDAssign  -- specific = Host defined in the template
              WHEN @v_AssignHostBehavior = 'random' THEN @v_GenHostID       -- random = Random amongst all hosts
              ELSE COALESCE(@v_HostID, @v_GenHostID)                        -- default/unimplemented = Player's host
            END
          -- ELSE
          --   CASE                                                            -- for unhosted
          --     WHEN @v_AssignHostBehaviorOverflow = 'specific' THEN          -- specific = Host defined in the template
          --       @v_HostIDAssignOverflow
          --     WHEN @v_AssignHostBehaviorOverflow = 'random' THEN            -- random = Random amongst all hosts
          --       @v_GenHostID
          --     ELSE NULL                                                     -- default/unimplemented = NULL
          --   END
          -- END
          , @ActionGenerationID, @v_Type, @v_Description,@v_Name,
          @v_DueDate, @v_StartFromDate, @v_Priority,
          'unactioned', @v_DissolveDate,
          @CurDate, @CurDate, 1
        );

      END;

      CLOSE users_cur;
      DEALLOCATE users_cur;
      CLOSE hosts_cur;
      DEALLOCATE hosts_cur;

      COMMIT;

    END;

  END;

  CLOSE inserted_cur;
  DEALLOCATE inserted_cur;

END;
GO
ALTER TABLE [dbo].[VE_HV_PLAYER_SEGMENT] ENABLE TRIGGER [bis2_trg_hv_player_segment_ins_trg]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[BIS2_TRG_HV_TASK_aUPSERT] ON [dbo].[VE_HV_Task]
AFTER UPDATE
	,INSERT
AS
BEGIN
	UPDATE VE_HV_Task
	SET [CompletionDate] = GETDATE()
	FROM VE_HV_Task t
	LEFT JOIN deleted d
		ON t.TaskID = d.TaskID
	LEFT JOIN inserted i
		ON t.TaskID = i.TaskID
	WHERE COALESCE(d.STATUS, 'unassigned') <> 'Closed'
		AND i.STATUS = 'Closed';

	--UPDATE BIS2_HV_TASK
	--SET [DissolveDate] = i.DissolveDate
	--FROM BIS2_HV_TASK t
	--LEFT JOIN deleted d
	--	ON t.TaskID = d.TaskID
	--LEFT JOIN inserted i
	--	ON t.TaskID = i.TaskID
	--WHERE i.DissolveDate IS NULL;
END;
GO
ALTER TABLE [dbo].[VE_HV_Task] ENABLE TRIGGER [BIS2_TRG_HV_TASK_aUPSERT]
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
CREATE TRIGGER [dbo].[trg_VE_AppPref_NoDelete]
   ON  [dbo].[VE_VW_HV_ApplicationPreferences]
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
USE [master]
GO
ALTER DATABASE [HostViz_IGT_Template] SET  READ_WRITE 
GO
