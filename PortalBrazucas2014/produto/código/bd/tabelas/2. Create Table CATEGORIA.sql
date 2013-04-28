---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA CATEGORIA --------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Categoria') IS NOT NULL 
	DROP TABLE [dbo].Categoria
GO

CREATE TABLE [dbo].[Categoria](
	[CodigoCategoria] [INT] IDENTITY(1,1) NOT NULL,
	[DescricaoCategoria] [VARCHAR] (128) NOT NULL,
	[TipoCategoria] [BIT] NULL
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED ([CodigoCategoria] ASC)
 );
GO