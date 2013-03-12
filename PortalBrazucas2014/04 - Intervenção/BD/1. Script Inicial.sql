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
-- CRIAÇÃO DA TABELA USUÁRIO ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE [BRAZUCAS]
GO

CREATE TABLE dbo.Usuario
	(
	Login varchar(8) NOT NULL,
	CnpjCpf numeric(14, 0) NOT NULL,
	Nome varchar(128) NOT NULL,
	Email varchar(52) NULL,
	Telefone numeric(10, 0) NULL,
	DataNascimento datetime NULL,
	Sexo char(1) NULL,
	Senha varchar(24) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Usuario ADD CONSTRAINT
	PK_Usuario PRIMARY KEY CLUSTERED 
	(
	Login
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Usuario SET (LOCK_ESCALATION = TABLE)
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA NOTÍCIA ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

CREATE TABLE dbo.Noticia
	(
	CodigoNoticia int NOT NULL IDENTITY (1, 1),
	Titulo varchar(128) NULL,
	DataPublicacao datetime NULL,
	Categoria varchar(32) NULL,
	Conteudo text NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Noticia ADD CONSTRAINT
	PK_Noticia PRIMARY KEY CLUSTERED 
	(
	CodigoNoticia
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Noticia SET (LOCK_ESCALATION = TABLE)
GO