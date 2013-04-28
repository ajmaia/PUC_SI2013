---------------------------------------------------------------------------------------------
-- CRIA��O DA TABELA USU�RIO ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Usuario') IS NOT NULL 
	DROP TABLE [dbo].[Usuario]
GO

CREATE TABLE [dbo].[Usuario](
	[LoginUsuario] [VARCHAR](8) NOT NULL,
	[CpfCnpj] [NUMERIC](14,0) NOT NULL,
	[NomeRazaoSocial] [VARCHAR] (128) NOT NULL,
	[Email] [VARCHAR] (128) NOT NULL,
	[DataNascimento] [DATETIME] NULL,
	[Sexo] [CHAR](1) NULL,
	[TipoPerfil] [VARCHAR](16) NOT NULL,
	[Senha] [VARCHAR](128) NOT NULL
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED ([LoginUsuario] ASC)
 );
GO