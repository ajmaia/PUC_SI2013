---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA NOTÍCIA ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Noticia') IS NOT NULL 
	DROP TABLE [dbo].Noticia
GO

CREATE TABLE [dbo].[Noticia](
	[CodigoNoticia] [INT] IDENTITY(1,1) NOT NULL,
	[Titulo] [VARCHAR] (128) NOT NULL,
	[CaminhoImagem] [VARCHAR] (128) NULL,
	[Conteudo] [TEXT] NOT NULL,
	[DataPublicacao] [DATETIME] NOT NULL,
	[Autor] [VARCHAR] (128) NOT NULL,
	[CodigoCategoria] [INT] NOT NULL,
	[DescricaoCategoria] [VARCHAR] (128) NOT NULL,
 CONSTRAINT [PK_Noticia] PRIMARY KEY CLUSTERED ([CodigoNoticia] ASC),
 CONSTRAINT [FK_Noticia_Categoria] FOREIGN KEY([CodigoCategoria])
	REFERENCES [dbo].[Categoria] ([CodigoCategoria])
		ON DELETE CASCADE
);
GO