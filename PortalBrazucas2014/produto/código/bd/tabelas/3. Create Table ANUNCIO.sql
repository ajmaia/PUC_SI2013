---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA ANUNCIO ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Anuncio') IS NOT NULL 
	DROP TABLE [dbo].Anuncio
GO

CREATE TABLE [dbo].[Anuncio](
	[CodigoAnuncio] [INT] IDENTITY(1,1) NOT NULL,
	[Titulo] [VARCHAR] (128) NOT NULL,
	[CaminhoImagem] [VARCHAR] (128) NULL,
	[Conteudo] [VARCHAR] (128) NULL,
	[DataPublicacao] [DATETIME] NOT NULL,
	[LoginCriacao] [VARCHAR](8) NOT NULL,
	[StatusAprovacao] [CHAR](1) NULL,
	[UsuarioAprovacao] [VARCHAR](8) NULL,
	[CodigoCategoria] [INT] NOT NULL,
	[DescricaoCategoria] [VARCHAR] (128) NOT NULL
 CONSTRAINT [PK_Anuncio] PRIMARY KEY CLUSTERED ([CodigoAnuncio] ASC),
 CONSTRAINT [FK_Anuncio_Categoria] FOREIGN KEY([CodigoCategoria])
	REFERENCES [dbo].[Categoria] ([CodigoCategoria])
		ON DELETE CASCADE,
 CONSTRAINT [FK_Anuncio_Usuario] FOREIGN KEY([LoginCriacao])
	REFERENCES [dbo].[Usuario] ([LoginUsuario])
		ON DELETE CASCADE
);
GO