IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TestLogin1')
CREATE LOGIN [TestLogin1] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [TestLogin1] FOR LOGIN [TestLogin1] WITH DEFAULT_SCHEMA=[TestLogin1]
GO
