---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA VW_BOLAO ---------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Bolao') IS NOT NULL 
	DROP VIEW [dbo].Bolao
GO

CREATE VIEW [dbo].[Bolao]
AS

SELECT
	[RankingBolao],
	[LoginUsuario],
	[NomeRazaoSocial],
	(
		[AcertosPlacarCompleto] +
		[AcertosResultadoPlacarParcial] +
		[AcertosResultado]
	) AS [Pontuacao],
	(
		(
			SELECT	PRI.[AcertosPlacarCompleto] +
					PRI.[AcertosResultadoPlacarParcial] +
					PRI.[AcertosResultado]
			FROM [dbo].[PontuacaoBolao] AS PRI
			WHERE PRI.[RankingBolao] = 1
		) -
		(
			[AcertosPlacarCompleto] +
			[AcertosResultadoPlacarParcial] +
			[AcertosResultado]
		)
	) AS [RelativoPrimeiroColocado],
	(
		(
			SELECT	PRI.[AcertosPlacarCompleto] +
					PRI.[AcertosResultadoPlacarParcial] +
					PRI.[AcertosResultado]
			FROM [dbo].[PontuacaoBolao] AS PRI
			WHERE PRI.[RankingBolao] = [RankingBolao] - 1
		) -
		(
			[AcertosPlacarCompleto] +
			[AcertosResultadoPlacarParcial] +
			[AcertosResultado]
		)
	) AS [RelativoColocadoAnterior]
FROM [dbo].[PontuacaoBolao]
GO
