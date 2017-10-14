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
