---------------------------------------------------------------------------------------------
-- CRIAÇÃO TRIGGER DE ATUALIZAÇÃO DE JOGOS --------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS;
GO

IF OBJECT_ID ('TR_AtualizacaoJogos', 'TR') IS NOT NULL
   DROP TRIGGER TR_AtualizacaoJogos;
GO

CREATE TRIGGER TR_AtualizacaoJogos
ON Jogo
AFTER UPDATE 
AS
	DECLARE @COD_JOGO INT
	SELECT @COD_JOGO = CodigoJogo FROM INSERTED
		
	DECLARE @temp_RODADA TABLE  (
			CodigoGrupo INT,
			Rank INT,
			CodigoSelecao INT,
			NomeSelecao VARCHAR(128)
	);
	
	-- Oitavas de final
	IF (@COD_JOGO BETWEEN 1 AND 48)
	BEGIN
		INSERT INTO @temp_RODADA
		SELECT CodigoGrupo, Rank, CodigoSelecao, NomeSelecao
		FROM Rodada
		WHERE NumeroRodada = 3 
		  AND Rank in (1, 2) 
		  AND Concluida = 1
			
		IF NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 1 AND Rank = 1 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 49))
		OR NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 2 AND Rank = 2 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 49))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 1 AND Rank = 1),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 1 AND Rank = 1),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 2 AND Rank = 2),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 2 AND Rank = 2)
			FROM Jogo
			WHERE CodigoJogo = 49

		IF NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 3 AND Rank = 1 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 50))
		OR NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 4 AND Rank = 2 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 50))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 3 AND Rank = 1),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 3 AND Rank = 1),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 4 AND Rank = 2),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 4 AND Rank = 2)
			FROM Jogo
			WHERE CodigoJogo = 50

		IF NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 2 AND Rank = 1 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 51))
		OR NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 1 AND Rank = 2 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 51))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 2 AND Rank = 1),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 2 AND Rank = 1),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 1 AND Rank = 2),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 1 AND Rank = 2)
			FROM Jogo
			WHERE CodigoJogo = 51

		IF NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 4 AND Rank = 1 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 52))
		OR NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 3 AND Rank = 2 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 52))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 4 AND Rank = 1),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 4 AND Rank = 1),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 3 AND Rank = 2),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 3 AND Rank = 2)
			FROM Jogo
			WHERE CodigoJogo = 52

		IF NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 5 AND Rank = 1 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 53))
		OR NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 6 AND Rank = 2 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 53))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 5 AND Rank = 1),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 5 AND Rank = 1),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 6 AND Rank = 2),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 6 AND Rank = 2)
			FROM Jogo
			WHERE CodigoJogo = 53

		IF NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 7 AND Rank = 1 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 54))
		OR NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 8 AND Rank = 2 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 54))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 7 AND Rank = 1),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 7 AND Rank = 1),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 8 AND Rank = 2),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 8 AND Rank = 2)
			FROM Jogo
			WHERE CodigoJogo = 54
		
		IF NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 6 AND Rank = 1 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 55))
		OR NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 5 AND Rank = 2 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 55))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 6 AND Rank = 1),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 6 AND Rank = 1),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 5 AND Rank = 2),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 5 AND Rank = 2)
			FROM Jogo
			WHERE CodigoJogo = 55

		IF NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 8 AND Rank = 1 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 56))
		OR NOT EXISTS(SELECT 1 FROM @temp_RODADA WHERE CodigoGrupo = 7 AND Rank = 2 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 56))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 8 AND Rank = 1),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 8 AND Rank = 1),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_RODADA WHERE CodigoGrupo = 7 AND Rank = 2),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_RODADA WHERE CodigoGrupo = 7 AND Rank = 2)
			FROM Jogo
			WHERE CodigoJogo = 56
	END
	-- Quartas de final
	ELSE IF (@COD_JOGO BETWEEN 49 AND 56)	
	BEGIN
		DECLARE @temp_OITAVAS TABLE  (
			CodigoJogo INT,
			CodigoProxJogo INT,
			CodigoSelecao INT,
			NomeSelecao VARCHAR(128)
		);
		
		INSERT INTO @temp_OITAVAS
		SELECT CodigoJogo,
			   CASE WHEN CodigoJogo IN (49, 50) THEN 57
					WHEN CodigoJogo IN (53, 54) THEN 58
					WHEN CodigoJogo IN (51, 52) THEN 59
					WHEN CodigoJogo IN (55, 56) THEN 60
			   END AS CodigoProxJogo,
			   CASE WHEN GolsSelecaoA > GolsSelecaoB THEN CodigoSelecaoA
					WHEN GolsSelecaoA < GolsSelecaoB THEN CodigoSelecaoB
			   END AS CodigoSelecaoVencedora,
			   CASE WHEN GolsSelecaoA > GolsSelecaoB THEN NomeSelecaoA
					WHEN GolsSelecaoA < GolsSelecaoB THEN NomeSelecaoB
			   END AS NomeSelecaoVencedora
		FROM Jogo
		WHERE CodigoJogo BETWEEN 49 AND 56
		  
		IF NOT EXISTS(SELECT 1 FROM @temp_OITAVAS WHERE CodigoJogo = 49 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 57))
		OR NOT EXISTS(SELECT 1 FROM @temp_OITAVAS WHERE CodigoJogo = 50 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 57))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 57 AND CodigoJogo = 49),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 57 AND CodigoJogo = 49),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 57 AND CodigoJogo = 50),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 57 AND CodigoJogo = 50)
			FROM Jogo
			WHERE CodigoJogo = 57

		IF NOT EXISTS(SELECT 1 FROM @temp_OITAVAS WHERE CodigoJogo = 53 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 58))
		OR NOT EXISTS(SELECT 1 FROM @temp_OITAVAS WHERE CodigoJogo = 54 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 58))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 58 AND CodigoJogo = 53),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 58 AND CodigoJogo = 53),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 58 AND CodigoJogo = 54),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 58 AND CodigoJogo = 54)
			FROM Jogo
			WHERE CodigoJogo = 58
			
		IF NOT EXISTS(SELECT 1 FROM @temp_OITAVAS WHERE CodigoJogo = 51 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 59))
		OR NOT EXISTS(SELECT 1 FROM @temp_OITAVAS WHERE CodigoJogo = 52 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 59))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 59 AND CodigoJogo = 51),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 59 AND CodigoJogo = 51),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 59 AND CodigoJogo = 52),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 59 AND CodigoJogo = 52)
			FROM Jogo
			WHERE CodigoJogo = 59

		IF NOT EXISTS(SELECT 1 FROM @temp_OITAVAS WHERE CodigoJogo = 55 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 60))
		OR NOT EXISTS(SELECT 1 FROM @temp_OITAVAS WHERE CodigoJogo = 56 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 60))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 60 AND CodigoJogo = 55),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 60 AND CodigoJogo = 55),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 60 AND CodigoJogo = 56),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_OITAVAS WHERE CodigoProxJogo = 60 AND CodigoJogo = 56)
			FROM Jogo
			WHERE CodigoJogo = 60
	END
	-- semifinal
	ELSE IF (@COD_JOGO BETWEEN 57 AND 60)	
	BEGIN
		DECLARE @temp_SEMIFINAL TABLE  (
			CodigoJogo INT,
			CodigoProxJogo INT,
			CodigoSelecao INT,
			NomeSelecao VARCHAR(128)
		);
		
		INSERT INTO @temp_SEMIFINAL
		SELECT CodigoJogo,
			   CASE WHEN CodigoJogo IN (57, 58) THEN 61
					WHEN CodigoJogo IN (59, 60) THEN 62
			   END AS CodigoProxJogo,
			   CASE WHEN GolsSelecaoA > GolsSelecaoB THEN CodigoSelecaoA
					WHEN GolsSelecaoA < GolsSelecaoB THEN CodigoSelecaoB
			   END AS CodigoSelecaoVencedora,
			   CASE WHEN GolsSelecaoA > GolsSelecaoB THEN NomeSelecaoA
					WHEN GolsSelecaoA < GolsSelecaoB THEN NomeSelecaoB
			   END AS NomeSelecaoVencedora
		FROM Jogo
		WHERE CodigoJogo BETWEEN 57 AND 60
		
		IF NOT EXISTS(SELECT 1 FROM @temp_SEMIFINAL WHERE CodigoJogo = 57 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 61))
		OR NOT EXISTS(SELECT 1 FROM @temp_SEMIFINAL WHERE CodigoJogo = 58 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 61))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_SEMIFINAL WHERE CodigoProxJogo = 61 AND CodigoJogo = 57),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_SEMIFINAL WHERE CodigoProxJogo = 61 AND CodigoJogo = 57),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_SEMIFINAL WHERE CodigoProxJogo = 61 AND CodigoJogo = 58),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_SEMIFINAL WHERE CodigoProxJogo = 61 AND CodigoJogo = 58)
			FROM Jogo
			WHERE CodigoJogo = 61

		IF NOT EXISTS(SELECT 1 FROM @temp_SEMIFINAL WHERE CodigoJogo = 59 AND CodigoSelecao = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 62))
		OR NOT EXISTS(SELECT 1 FROM @temp_SEMIFINAL WHERE CodigoJogo = 60 AND CodigoSelecao = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 62))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecao FROM @temp_SEMIFINAL WHERE CodigoProxJogo = 62 AND CodigoJogo = 59),
				NomeSelecaoA = (SELECT NomeSelecao FROM @temp_SEMIFINAL WHERE CodigoProxJogo = 62 AND CodigoJogo = 59),
				CodigoSelecaoB = (SELECT CodigoSelecao FROM @temp_SEMIFINAL WHERE CodigoProxJogo = 62 AND CodigoJogo = 60),
				NomeSelecaoB = (SELECT NomeSelecao FROM @temp_SEMIFINAL WHERE CodigoProxJogo = 62 AND CodigoJogo = 60)
			FROM Jogo
			WHERE CodigoJogo = 62
	END
	-- 3º Lugar e final
	ELSE IF (@COD_JOGO BETWEEN 61 AND 62)	
	BEGIN
		DECLARE @temp_FINAL TABLE  (
			CodigoJogo INT,
			CodigoSelecaoVitoria INT,
			NomeSelecaoVitoria VARCHAR(128),
			CodigoSelecaoDerrota INT,
			NomeSelecaoDerrota VARCHAR(128)
		);
		
		INSERT INTO @temp_FINAL
		SELECT CodigoJogo,
			   CASE WHEN GolsSelecaoA > GolsSelecaoB THEN CodigoSelecaoA
					WHEN GolsSelecaoA < GolsSelecaoB THEN CodigoSelecaoB
			   END AS CodigoSelecaoVencedora,
			   CASE WHEN GolsSelecaoA > GolsSelecaoB THEN NomeSelecaoA
					WHEN GolsSelecaoA < GolsSelecaoB THEN NomeSelecaoB
			   END AS NomeSelecaoVencedora,
			   CASE WHEN GolsSelecaoA < GolsSelecaoB THEN CodigoSelecaoA
					WHEN GolsSelecaoA > GolsSelecaoB THEN CodigoSelecaoB
			   END AS CodigoSelecaoPerdedora,
			   CASE WHEN GolsSelecaoA < GolsSelecaoB THEN NomeSelecaoA
					WHEN GolsSelecaoA > GolsSelecaoB THEN NomeSelecaoB
			   END AS NomeSelecaoPerdedora
		FROM Jogo
		WHERE CodigoJogo BETWEEN 61 AND 62
		
		IF NOT EXISTS(SELECT 1 FROM @temp_FINAL WHERE CodigoJogo = 61 AND CodigoSelecaoDerrota = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 64))
		OR NOT EXISTS(SELECT 1 FROM @temp_FINAL WHERE CodigoJogo = 62 AND CodigoSelecaoDerrota = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 64))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecaoDerrota FROM @temp_FINAL WHERE CodigoJogo = 61),
				NomeSelecaoA = (SELECT NomeSelecaoDerrota FROM @temp_FINAL WHERE CodigoJogo = 61),
				CodigoSelecaoB = (SELECT CodigoSelecaoDerrota FROM @temp_FINAL WHERE CodigoJogo = 62),
				NomeSelecaoB = (SELECT NomeSelecaoDerrota FROM @temp_FINAL WHERE CodigoJogo = 62)
			FROM Jogo
			WHERE CodigoJogo = 63
			
		IF NOT EXISTS(SELECT 1 FROM @temp_FINAL WHERE CodigoJogo = 61 AND CodigoSelecaoVitoria = (SELECT CodigoSelecaoA FROM Jogo WHERE CodigoJogo = 63))
		OR NOT EXISTS(SELECT 1 FROM @temp_FINAL WHERE CodigoJogo = 62 AND CodigoSelecaoVitoria = (SELECT CodigoSelecaoB FROM Jogo WHERE CodigoJogo = 63))
			UPDATE Jogo
			SET CodigoSelecaoA = (SELECT CodigoSelecaoVitoria FROM @temp_FINAL WHERE CodigoJogo = 61),
				NomeSelecaoA = (SELECT NomeSelecaoVitoria FROM @temp_FINAL WHERE CodigoJogo = 61),
				CodigoSelecaoB = (SELECT CodigoSelecaoVitoria FROM @temp_FINAL WHERE CodigoJogo = 62),
				NomeSelecaoB = (SELECT NomeSelecaoVitoria FROM @temp_FINAL WHERE CodigoJogo = 62)
			FROM Jogo
			WHERE CodigoJogo = 64
	END
GO