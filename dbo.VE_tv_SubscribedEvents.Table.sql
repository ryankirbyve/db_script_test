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
