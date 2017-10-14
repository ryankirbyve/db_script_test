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
CREATE USER [BIS2\brocheb] FOR LOGIN [BIS2\brocheb] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [BIS2\brocheb]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BIS2\brocheb]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [BIS2\brocheb]
GO
