---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA COMENTÁRIO -------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Comentario') IS NOT NULL 
	DROP TABLE [dbo].Comentario
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
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED ([CodigoComentario] ASC),
 CONSTRAINT [FK_Comentario_Noticia] FOREIGN KEY([CodigoNoticia])
	REFERENCES [dbo].[Noticia] ([CodigoNoticia])
		ON DELETE CASCADE
);
GO