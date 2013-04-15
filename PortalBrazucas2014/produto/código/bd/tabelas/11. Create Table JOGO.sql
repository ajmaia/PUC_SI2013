---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA JOGO -------------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Jogo') IS NOT NULL 
	DROP TABLE [dbo].Jogo
GO

CREATE TABLE [dbo].[Jogo](
	[CodigoJogo] [INT] IDENTITY(1,1) NOT NULL,
	[CodigoCidade] [INT] NOT NULL,
	[NomeCidade] [VARCHAR](128) NOT NULL,
	[LocalVendaIngresso] [VARCHAR] (128) NULL,
	[Rodada] [INT] NOT NULL,
	[CodigoSelecaoA] [INT] NOT NULL,
	[NomeSelecaoA] [VARCHAR](128) NOT NULL,
	[GolsSelecaoA] [INT] NULL,
	[CodigoSelecaoB] [INT] NOT NULL,
	[NomeSelecaoB] [VARCHAR](128) NOT NULL,
	[GolsSelecaoB] [INT] NULL,
	[DataHora] [DATETIME] NOT NULL,
	[CaminhoImagem] [VARCHAR](128) NULL
 CONSTRAINT [PK_Jogo] PRIMARY KEY CLUSTERED 
(
	[CodigoJogo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Jogo]  WITH CHECK ADD  CONSTRAINT [FK_Jogo_SelecaoA] FOREIGN KEY([CodigoSelecaoA])
REFERENCES [dbo].[Selecao] ([CodigoSelecao])
GO

ALTER TABLE [dbo].[Jogo]  WITH CHECK ADD  CONSTRAINT [FK_Jogo_SelecaoB] FOREIGN KEY([CodigoSelecaoB])
REFERENCES [dbo].[Selecao] ([CodigoSelecao])
GO

ALTER TABLE [dbo].[Jogo]  WITH CHECK ADD  CONSTRAINT [FK_Jogo_Cidade] FOREIGN KEY([CodigoCidade])
REFERENCES [dbo].[Cidade] ([CodigoCidade])
GO