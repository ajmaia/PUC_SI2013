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
	[CodigoSelecaoA] [INT] NULL,
	[NomeSelecaoA] [VARCHAR](128) NULL,
	[GolsSelecaoA] [INT] NULL,
	[ExpulsoesSelecaoA] [INT] NULL,
	[CodigoSelecaoB] [INT] NULL,
	[NomeSelecaoB] [VARCHAR](128) NULL,
	[GolsSelecaoB] [INT] NULL,
	[ExpulsoesSelecaoB] [INT] NULL,
	[DataHora] [DATETIME] NOT NULL,
	[CaminhoImagem] [VARCHAR](128) NULL
 CONSTRAINT [PK_Jogo] PRIMARY KEY CLUSTERED ([CodigoJogo] ASC),
 CONSTRAINT [FK_Jogo_Cidade] FOREIGN KEY([CodigoCidade])
	REFERENCES [dbo].[Cidade] ([CodigoCidade])
		ON DELETE CASCADE
);
GO