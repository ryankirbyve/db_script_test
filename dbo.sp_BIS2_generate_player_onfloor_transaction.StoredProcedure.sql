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
