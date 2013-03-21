---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA VW_DESEMPENHOSELECAO ---------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE VIEW [dbo].[DesempenhoSelecao]
AS

SELECT
	His.[RankingFIFA],
	Sel.[Nome],
	Sel.[Pais],
	Sel.[CaminhoImagem],
	His.[QuantidadeJogosHistorico],
	His.[VitoriasHistorico],
	His.[EmpatesHistorico],
	His.[DerrotasHistorico],
	His.[GolsRealizadosHistorico],
	His.[GolsSofridosHistorico]
FROM [dbo].[Selecao] AS Sel
INNER JOIN [dbo].[Historia] AS His ON His.[CodigoHistoria] = Sel.[CodigoHistoria]
GO