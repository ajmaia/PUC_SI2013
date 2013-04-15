---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA VW_RODADA --------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Rodada') IS NOT NULL 
	DROP VIEW [dbo].Rodada
GO

CREATE VIEW [dbo].[Rodada]
AS

SELECT
	[DescricaoRodada],
	[Fase],
	[CodigoSelecao],
	[NomeSelecao],
	[CodigoGrupo],
	SUM([Empates])			AS [Empates],
	SUM([Vitorias])			AS [Vitorias],
	SUM([Derrotas])			AS [Derrotas],
	SUM([GolsRealizados])	AS [GolsRealizados],
	SUM([GolsSofridos])		AS [GolsSofridos]
FROM 
(
	SELECT 
		[Rodada] AS [DescricaoRodada],
		(CASE WHEN SelA.[CodigoGrupo] = SelB.[CodigoGrupo] THEN 'Grupos' 
			  ELSE 'Eliminatórias' END)	AS [Fase],
		SelA.[CodigoSelecao],
		SelA.[Nome] AS [NomeSelecao],
		SelA.[CodigoGrupo],
		(CASE WHEN [GolsSelecaoA] = [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Empates],
		(CASE WHEN [GolsSelecaoA] > [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Vitorias],
		(CASE WHEN [GolsSelecaoA] < [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Derrotas],
		[GolsSelecaoA] AS [GolsRealizados],
		[GolsSelecaoB] AS [GolsSofridos]
	FROM [dbo].[Jogo] (NOLOCK)
	INNER JOIN [dbo].[Selecao] AS SelA (NOLOCK) ON [CodigoSelecaoA] = SelA.[CodigoSelecao]
	INNER JOIN [dbo].[Selecao] AS SelB (NOLOCK) ON [CodigoSelecaoB] = SelB.[CodigoSelecao]
	
	UNION ALL
	
	SELECT 
		[Rodada] AS [DescricaoRodada],
		(CASE WHEN SelA.[CodigoGrupo] = SelB.[CodigoGrupo] THEN 'Grupos' 
			  ELSE 'Eliminatórias' END)	AS [Fase],
		SelB.[CodigoSelecao],
		SelB.[Nome] AS [NomeSelecao],
		SelB.[CodigoGrupo],
		(CASE WHEN [GolsSelecaoB] = [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Empates],
		(CASE WHEN [GolsSelecaoB] > [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Vitorias],
		(CASE WHEN [GolsSelecaoB] < [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Derrotas],
		[GolsSelecaoB] AS [GolsRealizados],
		[GolsSelecaoA] AS [GolsSofridos]
	FROM [dbo].[Jogo] (NOLOCK)
	INNER JOIN [dbo].[Selecao] AS SelA (NOLOCK) ON [CodigoSelecaoA] = SelA.[CodigoSelecao]
	INNER JOIN [dbo].[Selecao] AS SelB (NOLOCK) ON [CodigoSelecaoB] = SelB.[CodigoSelecao]
) AS [TabelaAux]
GROUP BY [DescricaoRodada]
		,[Fase]
		,[CodigoSelecao]
		,[NomeSelecao]
		,[CodigoGrupo]
GO