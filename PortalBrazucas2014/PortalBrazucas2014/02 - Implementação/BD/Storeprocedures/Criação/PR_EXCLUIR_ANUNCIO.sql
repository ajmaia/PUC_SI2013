---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA PROCEDURE PR_EXCLUIR_ANUNCIO --------------------------------------------------
---------------------------------------------------------------------------------------------

USE [BRAZUCAS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID ( 'PR_EXCLUIR_ANUNCIO', 'P' ) IS NOT NULL 
    DROP PROCEDURE PR_EXCLUIR_ANUNCIO;
GO

CREATE PROCEDURE PR_EXCLUIR_ANUNCIO
	@CodigoAnuncio [INT]
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRAN EXCLUSAO;
	
	DELETE FROM [BRAZUCAS].[dbo].[Anuncio]
	WHERE [CodigoAnuncio] = @CodigoAnuncio
	 
	IF @@ERROR > 0
		ROLLBACK TRAN EXCLUSAO;
	ELSE
		COMMIT TRAN EXCLUSAO;
	
END
GO
