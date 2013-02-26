---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA BASE DE DADOS -----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE master;
GO
IF DB_ID (N'BRAZUCAS') IS NOT NULL
DROP DATABASE BRAZUCAS;
GO
CREATE DATABASE BRAZUCAS;
GO
-- Verify the database files and sizes
SELECT name, size, size*1.0/128 AS [Size in MBs] 
FROM sys.master_files
WHERE name = N'BRAZUCAS';
GO

USE master;
GO
IF DB_ID (N'BRAZUCAS') IS NOT NULL
DROP DATABASE BRAZUCAS;
GO
CREATE DATABASE BRAZUCAS;
GO
-- Verify the database files and sizes
SELECT name, size, size*1.0/128 AS [Size in MBs] 
FROM sys.master_files
WHERE name = N'BRAZUCAS';
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DO USUÁRIO DE BANCO DE DADOS -----------------------------------------------------
---------------------------------------------------------------------------------------------


CREATE LOGIN [owner_brazucas] WITH PASSWORD=N'owner_brazucas', DEFAULT_DATABASE=[BRAZUCAS], DEFAULT_LANGUAGE=[Português (Brasil)], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
EXEC sys.sp_addsrvrolemember @loginame = N'owner_brazucas', @rolename = N'sysadmin'
GO
ALTER LOGIN [owner_brazucas] DISABLE
GO

USE BRAZUCAS;
GO

CREATE USER [owner_brazucas] FOR LOGIN [owner_brazucas] WITH DEFAULT_SCHEMA=[dbo]