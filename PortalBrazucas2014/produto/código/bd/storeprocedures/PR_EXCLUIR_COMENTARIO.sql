---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA PROCEDURE PR_EXCLUIR_COMENTARIO -----------------------------------------------
---------------------------------------------------------------------------------------------

USE [BRAZUCAS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID ( 'PR_EXCLUIR_COMENTARIO', 'P' ) IS NOT NULL 
    DROP PROCEDURE PR_EXCLUIR_COMENTARIO;
GO

CREATE PROCEDURE PR_EXCLUIR_COMENTARIO
	@CodigoComentario [INT]
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRAN EXCLUSAO;
	
	DELETE FROM [BRAZUCAS].[dbo].[Comentario]
	WHERE [CodigoComentario] = @CodigoComentario
	 
	IF @@ERROR > 0
		ROLLBACK TRAN EXCLUSAO;
	ELSE
		COMMIT TRAN EXCLUSAO;
	
END
GO
