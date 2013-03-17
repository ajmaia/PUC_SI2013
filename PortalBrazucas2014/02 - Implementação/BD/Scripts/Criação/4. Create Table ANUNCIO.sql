---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA ANUNCIO ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Anuncio](
	[CodigoAnuncio] [INT] IDENTITY(1,1) NOT NULL,
	[Titulo] [VARCHAR] (128) NOT NULL,
	[CaminhoImagem] [VARCHAR] (128) NULL,
	[Conteudo] [VARCHAR] (128) NOT NULL,
	[DataPublicacao] [DATETIME] NOT NULL,
	[LoginCriacao] [VARCHAR](8) NOT NULL,
	[StatusAprovacao] [CHAR](1) NULL,
	[UsuarioAprovacao] [VARCHAR](8) NULL,
	[CodigoCategoria] [INT] NOT NULL,
	[DescricaoCategoria] [VARCHAR] (128) NOT NULL
 CONSTRAINT [PK_Anuncio] PRIMARY KEY CLUSTERED 
(
	[CodigoAnuncio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Anuncio]  WITH CHECK ADD  CONSTRAINT [FK_Anuncio_Categoria] FOREIGN KEY([CodigoCategoria])
REFERENCES [dbo].[Categoria] ([CodigoCategoria])
GO

ALTER TABLE [dbo].[Anuncio]  WITH CHECK ADD  CONSTRAINT [FK_Anuncio_Usuario] FOREIGN KEY([LoginCriacao])
REFERENCES [dbo].[Usuario] ([LoginUsuario])
GO