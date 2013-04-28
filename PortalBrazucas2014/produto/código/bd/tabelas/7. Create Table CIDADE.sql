---------------------------------------------------------------------------------------------
-- CRIA��O DA TABELA CIDADE -----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Cidade') IS NOT NULL 
	DROP TABLE [dbo].Cidade
GO

CREATE TABLE [dbo].[Cidade](
	[CodigoCidade] [INT] IDENTITY(1,1) NOT NULL,
	[Nome] [VARCHAR](128) NOT NULL,
	[UF] [CHAR](2) NOT NULL,
	[CaminhoImagem] [VARCHAR](128) NULL,
	[NomeEstadio] [VARCHAR](128) NULL,
	[CapacidadeEstadio] [INT] NULL,
	[InformacoesEstadio][VARCHAR](128) NULL
 CONSTRAINT [PK_Cidade] PRIMARY KEY CLUSTERED ([CodigoCidade] ASC)
 );
GO