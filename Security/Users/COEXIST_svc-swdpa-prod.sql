IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'COEXIST\svc-swdpa-prod')
CREATE LOGIN [COEXIST\svc-swdpa-prod] FROM WINDOWS
GO
CREATE USER [COEXIST\svc-swdpa-prod] FOR LOGIN [COEXIST\svc-swdpa-prod] WITH DEFAULT_SCHEMA=[COEXIST\svc-swdpa-prod]
GO
