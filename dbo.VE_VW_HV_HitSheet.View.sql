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
