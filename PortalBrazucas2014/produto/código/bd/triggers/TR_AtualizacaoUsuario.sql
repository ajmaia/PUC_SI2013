---------------------------------------------------------------------------------------------
-- CRIAÇÃO TRIGGER DE ATUALIZAÇÃO DE USUÁRIOS -----------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS;
GO
IF OBJECT_ID ('TR_AtualizacaoUsuario', 'TR') IS NOT NULL
   DROP TRIGGER TR_AtualizacaoUsuario;
GO
CREATE TRIGGER TR_AtualizacaoUsuario
ON Usuario
AFTER UPDATE 
AS
	DECLARE @LoginUsuario VARCHAR(8), @NomeRazaoSocial VARCHAR(128);
	
	DECLARE usuario_cursor CURSOR FOR 
	SELECT LoginUsuario, NomeRazaoSocial
	FROM Usuario;
	
	OPEN usuario_cursor
	
	FETCH NEXT FROM usuario_cursor 
	INTO @LoginUsuario, @NomeRazaoSocial
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Comentario
		SET NomeLoginCriacao = @NomeRazaoSocial
		WHERE LoginCriacao = @LoginUsuario

		UPDATE PontuacaoBolao
		SET NomeRazaoSocial = @NomeRazaoSocial
		WHERE LoginUsuario = @LoginUsuario

		FETCH NEXT FROM usuario_cursor 
		INTO @LoginUsuario, @NomeRazaoSocial
	END
	
	CLOSE usuario_cursor;
	DEALLOCATE usuario_cursor;
GO
