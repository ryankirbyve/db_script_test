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
CREATE USER [VIZ_RR2016_HostViz] FOR LOGIN [VIZ_RR2016_HostViz] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [VIZ_RR2016_HostViz]
GO
ALTER ROLE [db_datareader] ADD MEMBER [VIZ_RR2016_HostViz]
GO
