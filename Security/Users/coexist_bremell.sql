IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'COEXIST\bremell')
CREATE LOGIN [COEXIST\bremell] FROM WINDOWS
GO
CREATE USER [coexist\bremell] FOR LOGIN [COEXIST\bremell] WITH DEFAULT_SCHEMA=[coexist\bremell]
GO
REVOKE CONNECT TO [coexist\bremell]
