SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Alexei Short
-- Create date: July 26, 2017
-- Description:	Dynamic SQL Procedure to populate local tables from Azure Blob Storage
-- =============================================
CREATE PROCEDURE [dbo].[stpCreateExternalTablesFromAzureForApplicationInsights]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @DatePart VARCHAR(100) = CAST(GETUTCDATE() AS DATE);
	DECLARE @HourPart VARCHAR(2) = LEFT(CONVERT(TIME(0), DATEADD(HOUR, -1, GETUTCDATE())), 2) + ':00';
	DECLARE @AppInsightsCreateEventTableSQL VARCHAR(5000) = 
	N'
	IF EXISTS ( SELECT * FROM sys.external_tables WHERE object_id = OBJECT_ID(''Servicing.tblWebsiteSelfServicePortalCollectionEvents'') )
	DROP EXTERNAL TABLE Servicing.tblWebsiteSelfServicePortalCollectionEvents

	CREATE EXTERNAL TABLE Servicing.tblWebsiteSelfServicePortalCollectionEvents
		( JSONData VARCHAR(8000))  
		WITH (   
			LOCATION = ''/testselfserviceportal_696f306d4e1c456cbfd93a9fe1dcb897/Event/'+@DatePart+'/'+@HourPart+''',
			DATA_SOURCE = selfserviceportaltest,
			FILE_FORMAT = blob_format
		)  
    ';
	DECLARE @AppInsightsCreatePageViewTableSQL VARCHAR(5000) = 
	N'
	IF EXISTS ( SELECT * FROM sys.external_tables WHERE object_id = OBJECT_ID(''Servicing.tblWebsiteSelfServicePortalCollectionPageViews'') )
	DROP EXTERNAL TABLE Servicing.tblWebsiteSelfServicePortalCollectionPageViews

	CREATE EXTERNAL TABLE Servicing.tblWebsiteSelfServicePortalCollectionPageViews
		( JSONData VARCHAR(8000))  
		WITH (   
			LOCATION = ''/testselfserviceportal_696f306d4e1c456cbfd93a9fe1dcb897/PageViews/'+@DatePart+'/'+@HourPart+''',
			DATA_SOURCE = selfserviceportaltest,
			FILE_FORMAT = blob_format
		)  
    ';

	EXEC (@AppInsightsCreateEventTableSQL);
	EXEC (@AppInsightsCreatePageViewTableSQL);

END
GO
