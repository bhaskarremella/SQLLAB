IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TestLogin')
CREATE LOGIN [TestLogin] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [TestLogin] FOR LOGIN [TestLogin]
GO
DENY ALTER ANY ROLE TO [TestLogin]
