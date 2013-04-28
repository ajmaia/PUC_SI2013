
---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA PROCEDURE QUE DEFINE OS JOGOS JA FASE DE GRUPOS -------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('PR_DEFINE_JOGOS_FASE_GRUPOS') IS NOT NULL 
	DROP PROCEDURE [dbo].[PR_DEFINE_JOGOS_FASE_GRUPOS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE PR_DEFINE_JOGOS_FASE_GRUPOS
AS
BEGIN
	SET NOCOUNT ON;
	
	CREATE TABLE #TEMP_JOGOS (
		NumeroJogo INT IDENTITY(1,1),
		Rodada INT NULL, 
		CodigoGrupo INT NULL, 
		CodigoSelecaoA INT NULL, 
		NomeSelecaoA VARCHAR(128) NULL, 
		CodigoSelecaoB INT NULL, 
		NomeSelecaoB VARCHAR(128) NULL
	)

	INSERT INTO #TEMP_JOGOS

	-- FASE GRUPOS - 1ª Rodada

	SELECT 1 AS Rodada, SA.CodigoGrupo, SA.CodigoSelecao, SA.Nome, SB.CodigoSelecao, SB.Nome
	FROM Selecao AS SA
	INNER JOIN Selecao AS SB ON SA.CodigoGrupo = SB.CodigoGrupo AND SA.OrdemGrupo = 1 AND SB.OrdemGrupo = 2

	UNION ALL

	SELECT 1 AS Rodada, SA.CodigoGrupo, SA.CodigoSelecao, SA.Nome, SB.CodigoSelecao, SB.Nome
	FROM Selecao AS SA
	INNER JOIN Selecao AS SB ON SA.CodigoGrupo = SB.CodigoGrupo AND SA.OrdemGrupo = 3 AND SB.OrdemGrupo = 4

	UNION ALL

	-- FASE GRUPOS - 2ª Rodada

	SELECT 2 AS Rodada, SA.CodigoGrupo, SA.CodigoSelecao, SA.Nome, SB.CodigoSelecao, SB.Nome
	FROM Selecao AS SA
	INNER JOIN Selecao AS SB ON SA.CodigoGrupo = SB.CodigoGrupo AND SA.OrdemGrupo = 1 AND SB.OrdemGrupo = 3

	UNION ALL

	SELECT 2 AS Rodada, SA.CodigoGrupo, SA.CodigoSelecao, SA.Nome, SB.CodigoSelecao, SB.Nome
	FROM Selecao AS SA
	INNER JOIN Selecao AS SB ON SA.CodigoGrupo = SB.CodigoGrupo AND SA.OrdemGrupo = 2 AND SB.OrdemGrupo = 4

	UNION ALL

	-- FASE GRUPOS - 3ª Rodada

	SELECT 3 AS Rodada, SA.CodigoGrupo, SA.CodigoSelecao, SA.Nome, SB.CodigoSelecao, SB.Nome
	FROM Selecao AS SA
	INNER JOIN Selecao AS SB ON SA.CodigoGrupo = SB.CodigoGrupo AND SA.OrdemGrupo = 1 AND SB.OrdemGrupo = 4

	UNION ALL

	SELECT 3 AS Rodada, SA.CodigoGrupo, SA.CodigoSelecao, SA.Nome, SB.CodigoSelecao, SB.Nome
	FROM Selecao AS SA
	INNER JOIN Selecao AS SB ON SA.CodigoGrupo = SB.CodigoGrupo AND SA.OrdemGrupo = 2 AND SB.OrdemGrupo = 3
	ORDER BY Rodada, CodigoGrupo

	UPDATE Jogo
	SET Jogo.Rodada = #TEMP_JOGOS.Rodada,
		Jogo.CodigoSelecaoA = #TEMP_JOGOS.CodigoSelecaoA,
		Jogo.NomeSelecaoA = #TEMP_JOGOS.NomeSelecaoA,
		Jogo.CodigoSelecaoB = #TEMP_JOGOS.CodigoSelecaoB,
		Jogo.NomeSelecaoB = #TEMP_JOGOS.NomeSelecaoB
	FROM Jogo
	INNER JOIN #TEMP_JOGOS ON CodigoJogo = NumeroJogo
END
GO
