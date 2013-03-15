---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA COMENTÁRIO -------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Comentario](
	[CodigoComentario] [INT] IDENTITY(1,1) NOT NULL,
	[Conteudo] [TEXT] NOT NULL,
	[LoginCriacao] [VARCHAR](8) NOT NULL,
	[NomeLoginCriacao] [VARCHAR](128) NOT NULL,
	[DataCriacao] [DATETIME] NOT NULL,
	[StatusAprovacao] [CHAR](1) NULL,
	[UsuarioAprovacao] [VARCHAR](8) NULL,
	[CodigoNoticia] [INT] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[CodigoComentario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Noticia] FOREIGN KEY([CodigoNoticia])
REFERENCES [dbo].[Noticia] ([CodigoNoticia])
GO

ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Usuario] FOREIGN KEY([LoginCriacao])
REFERENCES [dbo].[Usuario] ([LoginUsuario])
GO
