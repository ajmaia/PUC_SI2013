---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA SELECAO -----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Selecao](
	[CodigoSelecao] [INT] IDENTITY(1,1) NOT NULL,
	[Nome] [VARCHAR](128) NOT NULL,
	[Pais] [VARCHAR](16) NOT NULL,
	[CaminhoImagem] [VARCHAR](128) NULL,
	[CodigoGrupo] [INT] IDENTITY(1,1) NOT NULL,
	[DescricaoGrupo] [VARCHAR] (128) NOT NULL
 CONSTRAINT [PK_Selecao] PRIMARY KEY CLUSTERED 
(
	[CodigoSelecao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Selecao]  WITH CHECK ADD  CONSTRAINT [FK_Selecao_Grupo] FOREIGN KEY([CodigoNoticia])
REFERENCES [dbo].[Grupo] ([CodigoGrupo])
GO