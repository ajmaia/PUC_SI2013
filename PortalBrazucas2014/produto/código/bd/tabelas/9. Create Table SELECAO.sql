---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA SELECAO -----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Selecao') IS NOT NULL 
	DROP TABLE [dbo].Selecao
GO

CREATE TABLE [dbo].[Selecao](
	[CodigoSelecao] [INT] IDENTITY(1,1) NOT NULL,
	[Nome] [VARCHAR](128) NOT NULL,
	[CaminhoImagem] [VARCHAR](128) NULL,
	[CodigoGrupo] [INT] NOT NULL,
	[OrdemGrupo] [INT] NULL,
	[DescricaoGrupo] [VARCHAR] (128) NOT NULL,
	[QuantidadeJogos] [INT] NULL,
	[Vitorias] [INT] NULL,
	[Empates] [INT] NULL,
	[Derrotas] [INT] NULL,
	[GolsRealizados] [INT] NULL,
	[GolsSofridos] [INT] NULL,
	[CodigoHistoria] [INT] NOT NULL,
	[TotalExpulsoes] [INT] NULL
 CONSTRAINT [PK_Selecao] PRIMARY KEY CLUSTERED ([CodigoSelecao] ASC),
 CONSTRAINT [FK_Selecao_Grupo] FOREIGN KEY([CodigoGrupo])
	REFERENCES [dbo].[Grupo] ([CodigoGrupo])
		ON DELETE CASCADE,
 CONSTRAINT [FK_Selecao_Historia] FOREIGN KEY([CodigoHistoria])
	REFERENCES [dbo].[Historia] ([CodigoHistoria])
		ON DELETE CASCADE
 );
GO