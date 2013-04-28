---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA PONTUACAOBOLAO ---------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('PontuacaoBolao') IS NOT NULL 
	DROP TABLE [dbo].PontuacaoBolao
GO

CREATE TABLE [dbo].[PontuacaoBolao](
	[CodigoPontuacaoBolao] [INT] IDENTITY(1,1) NOT NULL,
	[LoginUsuario] [VARCHAR](8) NOT NULL,
	[NomeRazaoSocial] [VARCHAR] (128) NOT NULL,
	[AcertosPlacarCompleto] [INT] NULL,
	[AcertosResultadoPlacarParcial] [INT] NULL,
	[AcertosResultado] [INT] NULL,
	[RankingBolao] [INT] NULL
 CONSTRAINT [PK_PontuacaoBolao] PRIMARY KEY CLUSTERED ([CodigoPontuacaoBolao] ASC),
 CONSTRAINT [FK_Pontuacao_Usuario] FOREIGN KEY([LoginUsuario])
	REFERENCES [dbo].[Usuario] ([LoginUsuario])
		ON DELETE CASCADE
);
GO

CREATE UNIQUE INDEX AK_LoginUsuario ON [PontuacaoBolao] ([LoginUsuario]); 
GO
