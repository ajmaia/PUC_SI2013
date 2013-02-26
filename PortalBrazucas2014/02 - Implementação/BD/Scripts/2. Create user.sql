CREATE LOGIN [owner_brazucas] WITH PASSWORD=N'owner_brazucas', DEFAULT_DATABASE=[BRAZUCAS], DEFAULT_LANGUAGE=[Português (Brasil)], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
EXEC sys.sp_addsrvrolemember @loginame = N'owner_brazucas', @rolename = N'sysadmin'
GO
ALTER LOGIN [owner_brazucas] DISABLE
GO

USE BRAZUCAS;
GO

CREATE USER [owner_brazucas] FOR LOGIN [owner_brazucas] WITH DEFAULT_SCHEMA=[dbo]