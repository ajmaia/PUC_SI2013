---------------------------------------------------------------------------------------------
-- CRIA��O DA TABELA NOT�CIA ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Noticia](
	[CodigoNoticia] [INT] IDENTITY(1,1) NOT NULL,
	[Titulo] [VARCHAR] (128) NOT NULL,
	[CaminhoImagem] [VARCHAR] (128) NULL,
	[Conteudo] [VARCHAR] (128) NOT NULL,
	[DataPublicacao] [DATETIME] NOT NULL,
	[Autor] [VARCHAR] (128) NOT NULL,
	[CodigoCategoria] [INT] NOT NULL,
	[DescricaoCategoria] [VARCHAR] (128) NOT NULL,
 CONSTRAINT [PK_Noticia] PRIMARY KEY CLUSTERED 
(
	[CodigoNoticia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Noticia]  WITH CHECK ADD  CONSTRAINT [FK_Noticia_Categoria] FOREIGN KEY([CodigoCategoria])
REFERENCES [dbo].[Categoria] ([CodigoCategoria])
GO