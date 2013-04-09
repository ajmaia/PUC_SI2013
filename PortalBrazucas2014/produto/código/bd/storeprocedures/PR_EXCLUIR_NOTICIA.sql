---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA PROCEDURE PR_EXCLUIR_NOTICIA --------------------------------------------------
---------------------------------------------------------------------------------------------

USE [BRAZUCAS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID ( 'PR_EXCLUIR_NOTICIA', 'P' ) IS NOT NULL 
    DROP PROCEDURE PR_EXCLUIR_NOTICIA;
GO

CREATE PROCEDURE PR_EXCLUIR_NOTICIA
	@CodigoNoticia [INT]
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRAN EXCLUSAO;
	
	-- Exclui todos os comentários da notícia
	DELETE FROM [BRAZUCAS].[dbo].[Comentario]
	WHERE [CodigoNoticia] = @CodigoNoticia
	
	DELETE FROM [BRAZUCAS].[dbo].[Noticia]
	WHERE [CodigoNoticia] = @CodigoNoticia
	 
	IF @@ERROR > 0
		ROLLBACK TRAN EXCLUSAO;
	ELSE
		COMMIT TRAN EXCLUSAO;
	
END
GO
