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
