IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TestLogin3')
CREATE LOGIN [TestLogin3] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [TestLogin3] FOR LOGIN [TestLogin3]
GO
