---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA VW_DESEMPENHOSELECAO ---------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE VIEW [dbo].[DesempenhoSelecao]
AS

SELECT
	[RankingFIFA],
	[Nome],
	[Pais],
	[CaminhoImagem],
	[QuantidadeJogos],
	[Vitorias],
	[Empates],
	[Derrotas],
	[GolsRealizados],
	[GolsSofridos]
FROM [dbo].[Selecao]
ORDER BY [RankingFIFA]
GO