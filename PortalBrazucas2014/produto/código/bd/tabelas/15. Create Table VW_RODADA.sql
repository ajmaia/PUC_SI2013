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
	RANK() OVER (PARTITION BY [CodigoGrupo], [NumeroRodada] ORDER BY [Vitorias] DESC, [SaldoGols] DESC, [Expulsoes] ASC, CodigoSelecao) AS [Rank],
	[DescricaoRodada],
	[NumeroRodada],
	[Concluida],
	[CodigoSelecao],
	[NomeSelecao],
	[CodigoGrupo],
	[Empates],
	[Vitorias],
	[Derrotas],
	[GolsRealizados],
	[GolsSofridos],
	[SaldoGols],
	[Expulsoes]
FROM
(
	SELECT
		[DescricaoRodada],
		[NumeroRodada],
		[Concluida],
		[CodigoSelecao],
		[NomeSelecao],
		[CodigoGrupo],
		SUM([Empates])								AS [Empates],
		SUM([Vitorias])								AS [Vitorias],
		SUM([Derrotas])								AS [Derrotas],
		SUM([GolsRealizados])						AS [GolsRealizados],
		SUM([GolsSofridos])							AS [GolsSofridos],
		SUM([GolsRealizados]) - SUM([GolsSofridos]) AS [SaldoGols],
		SUM([Expulsoes])							AS [Expulsoes]
	FROM 
	(
		SELECT 
			'Fase de Grupos' AS [DescricaoRodada],
			1 AS [NumeroRodada],
			CASE WHEN [GolsSelecaoA] IS NOT NULL 
				  AND [GolsSelecaoB] IS NOT NULL THEN 1 ELSE 0 END AS [Concluida],
			SelA.[CodigoSelecao],
			SelA.[Nome] AS [NomeSelecao],
			SelA.[CodigoGrupo],
			(CASE WHEN [GolsSelecaoA] = [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Empates],
			(CASE WHEN [GolsSelecaoA] > [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Vitorias],
			(CASE WHEN [GolsSelecaoA] < [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Derrotas],
			[GolsSelecaoA] AS [GolsRealizados],
			[GolsSelecaoB] AS [GolsSofridos],
			[ExpulsoesSelecaoA] AS [Expulsoes]
		FROM [dbo].[Jogo] (NOLOCK)
		INNER JOIN [dbo].[Selecao] AS SelA (NOLOCK) ON [CodigoSelecaoA] = SelA.[CodigoSelecao]
		INNER JOIN [dbo].[Selecao] AS SelB (NOLOCK) ON [CodigoSelecaoB] = SelB.[CodigoSelecao]
		WHERE [Rodada] IN (1)
		
		UNION ALL
		
		SELECT 
			'Fase de Grupos' AS [DescricaoRodada],
			1 AS [Rodada],
			ISNULL((
				SELECT TOP 1 1 FROM Jogo AS G
				WHERE (G.[Rodada] = 1
				  AND G.[CodigoSelecaoA] = SelA.[CodigoSelecao] OR G.[CodigoSelecaoB] = SelA.[CodigoSelecao])
				  AND G.[GolsSelecaoA] IS NOT NULL 
				  AND G.[GolsSelecaoB] IS NOT NULL
			),0) AS [Concluida],
			SelB.[CodigoSelecao],
			SelB.[Nome] AS [NomeSelecao],
			SelB.[CodigoGrupo],
			(CASE WHEN [GolsSelecaoB] = [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Empates],
			(CASE WHEN [GolsSelecaoB] > [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Vitorias],
			(CASE WHEN [GolsSelecaoB] < [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Derrotas],
			[GolsSelecaoB] AS [GolsRealizados],
			[GolsSelecaoA] AS [GolsSofridos],
			[ExpulsoesSelecaoA] AS [Expulsoes]
		FROM [dbo].[Jogo] (NOLOCK)
		INNER JOIN [dbo].[Selecao] AS SelA (NOLOCK) ON [CodigoSelecaoA] = SelA.[CodigoSelecao]
		INNER JOIN [dbo].[Selecao] AS SelB (NOLOCK) ON [CodigoSelecaoB] = SelB.[CodigoSelecao]
		WHERE [Rodada] IN (1)
		
		UNION ALL
		
		SELECT 
			'Fase de Grupos' AS [DescricaoRodada],
			2 AS [Rodada],
			ISNULL((
				SELECT TOP 1 1 FROM Jogo AS G
				WHERE (G.[Rodada] = 1
				  AND G.[CodigoSelecaoA] = SelB.[CodigoSelecao] OR G.[CodigoSelecaoB] = SelB.[CodigoSelecao])
				  AND G.[GolsSelecaoA] IS NOT NULL 
				  AND G.[GolsSelecaoB] IS NOT NULL
			),0) AS [Concluida],
			SelA.[CodigoSelecao],
			SelA.[Nome] AS [NomeSelecao],
			SelA.[CodigoGrupo],
			(CASE WHEN [GolsSelecaoA] = [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Empates],
			(CASE WHEN [GolsSelecaoA] > [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Vitorias],
			(CASE WHEN [GolsSelecaoA] < [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Derrotas],
			[GolsSelecaoA] AS [GolsRealizados],
			[GolsSelecaoB] AS [GolsSofridos],
			[ExpulsoesSelecaoA] AS [Expulsoes]
		FROM [dbo].[Jogo] (NOLOCK)
		INNER JOIN [dbo].[Selecao] AS SelA (NOLOCK) ON [CodigoSelecaoA] = SelA.[CodigoSelecao]
		INNER JOIN [dbo].[Selecao] AS SelB (NOLOCK) ON [CodigoSelecaoB] = SelB.[CodigoSelecao]
		WHERE [Rodada] IN (1, 2)
		
		UNION ALL
		
		SELECT 
			'Fase de Grupos' AS [DescricaoRodada],
			2 AS [Rodada],
			CASE WHEN [GolsSelecaoA] IS NOT NULL 
				  AND [GolsSelecaoB] IS NOT NULL 
				  AND [Rodada] = 2 THEN 1 ELSE 0 END AS [Concluida],
			SelB.[CodigoSelecao],
			SelB.[Nome] AS [NomeSelecao],
			SelB.[CodigoGrupo],
			(CASE WHEN [GolsSelecaoB] = [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Empates],
			(CASE WHEN [GolsSelecaoB] > [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Vitorias],
			(CASE WHEN [GolsSelecaoB] < [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Derrotas],
			[GolsSelecaoB] AS [GolsRealizados],
			[GolsSelecaoA] AS [GolsSofridos],
			[ExpulsoesSelecaoA] AS [Expulsoes]
		FROM [dbo].[Jogo] (NOLOCK)
		INNER JOIN [dbo].[Selecao] AS SelA (NOLOCK) ON [CodigoSelecaoA] = SelA.[CodigoSelecao]
		INNER JOIN [dbo].[Selecao] AS SelB (NOLOCK) ON [CodigoSelecaoB] = SelB.[CodigoSelecao]
		WHERE [Rodada] IN (1, 2)

		UNION ALL
		
		SELECT 
			'Fase de Grupos' AS [DescricaoRodada],
			3 AS [Rodada],
			ISNULL((
				SELECT TOP 1 1 FROM Jogo AS G
				WHERE (G.[Rodada] = 3
				  AND G.[CodigoSelecaoA] = SelA.[CodigoSelecao] OR G.[CodigoSelecaoB] = SelA.[CodigoSelecao])
				  AND G.[GolsSelecaoA] IS NOT NULL 
				  AND G.[GolsSelecaoB] IS NOT NULL
			),0) AS [Concluida],
			SelA.[CodigoSelecao],
			SelA.[Nome] AS [NomeSelecao],
			SelA.[CodigoGrupo],
			(CASE WHEN [GolsSelecaoA] = [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Empates],
			(CASE WHEN [GolsSelecaoA] > [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Vitorias],
			(CASE WHEN [GolsSelecaoA] < [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Derrotas],
			[GolsSelecaoA] AS [GolsRealizados],
			[GolsSelecaoB] AS [GolsSofridos],
			[ExpulsoesSelecaoA] AS [Expulsoes]
		FROM [dbo].[Jogo] (NOLOCK)
		INNER JOIN [dbo].[Selecao] AS SelA (NOLOCK) ON [CodigoSelecaoA] = SelA.[CodigoSelecao]
		INNER JOIN [dbo].[Selecao] AS SelB (NOLOCK) ON [CodigoSelecaoB] = SelB.[CodigoSelecao]
		WHERE [Rodada] IN (1, 2, 3)
		
		UNION ALL
		
		SELECT 
			'Fase de Grupos' AS [DescricaoRodada],
			3 AS [Rodada],
			ISNULL((
				SELECT TOP 1 1 FROM Jogo AS G
				WHERE (G.[Rodada] = 3
				  AND G.[CodigoSelecaoA] = SelB.[CodigoSelecao] OR G.[CodigoSelecaoB] = SelB.[CodigoSelecao])
				  AND G.[GolsSelecaoA] IS NOT NULL 
				  AND G.[GolsSelecaoB] IS NOT NULL
			),0) AS [Concluida],
			SelB.[CodigoSelecao],
			SelB.[Nome] AS [NomeSelecao],
			SelB.[CodigoGrupo],
			(CASE WHEN [GolsSelecaoB] = [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Empates],
			(CASE WHEN [GolsSelecaoB] > [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Vitorias],
			(CASE WHEN [GolsSelecaoB] < [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Derrotas],
			[GolsSelecaoB] AS [GolsRealizados],
			[GolsSelecaoA] AS [GolsSofridos],
			[ExpulsoesSelecaoA] AS [Expulsoes]
		FROM [dbo].[Jogo] (NOLOCK)
		INNER JOIN [dbo].[Selecao] AS SelA (NOLOCK) ON [CodigoSelecaoA] = SelA.[CodigoSelecao]
		INNER JOIN [dbo].[Selecao] AS SelB (NOLOCK) ON [CodigoSelecaoB] = SelB.[CodigoSelecao]
		WHERE [Rodada] IN (1, 2, 3)
	) AS [TabelaAux]
	GROUP BY [DescricaoRodada]
			,[NumeroRodada]
			,[Concluida]
			,[CodigoSelecao]
			,[NomeSelecao]
			,[CodigoGrupo]
) AS [Tabela]		
GO