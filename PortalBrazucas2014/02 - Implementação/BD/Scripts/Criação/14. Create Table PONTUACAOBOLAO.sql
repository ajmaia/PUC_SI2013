---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA PONTUACAOBOLAO ---------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[PontuacaoBolao](
	[CodigoBolao] [INT] IDENTITY(1,1) NOT NULL,
	[LoginUsuario] [VARCHAR](8) NOT NULL,
	[NomeRazaoSocial] [VARCHAR] (128) NOT NULL,
	[AcertosPlacarCompleto] [INT] NULL,
	[AcertosResultadoPlacarParcial] [INT] NULL,
	[AcertosResultado] [INT] NULL,
	[RankingBolao] [INT] NULL
 CONSTRAINT [PK_PontuacaoBolao] PRIMARY KEY CLUSTERED 
(
	[CodigoBolao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PontuacaoBolao]  WITH CHECK ADD  CONSTRAINT [FK_Pontuacao_Usuario] FOREIGN KEY([LoginUsuario])
REFERENCES [dbo].[Usuario] ([LoginUsuario])
GO
