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