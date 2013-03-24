---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA PROCEDURE PR_EDITAR_ANUNCIO ---------------------------------------------------
---------------------------------------------------------------------------------------------

USE [BRAZUCAS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID ( 'PR_EDITAR_ANUNCIO', 'P' ) IS NOT NULL 
    DROP PROCEDURE PR_EDITAR_ANUNCIO;
GO

CREATE PROCEDURE PR_EDITAR_ANUNCIO
	@CodigoAnuncio [INT],
	@Titulo [VARCHAR](128),
	@CaminhoImagem [VARCHAR](128),
	@Conteudo [TEXT],
	@DataPublicacao [DATETIME],
	@LoginCriacao [VARCHAR](8),
	@StatusAprovacao [CHAR](1),
	@UsuarioAprovacao [VARCHAR](8),
	@CodigoCategoria [INT],
	@DescricaoCategoria [VARCHAR](128)
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRAN ATUALIZACAO;
	
	UPDATE [BRAZUCAS].[dbo].[Anuncio]
	   SET [Titulo] = @Titulo
		  ,[CaminhoImagem] = @CaminhoImagem
		  ,[Conteudo] = @Conteudo
		  ,[DataPublicacao] = @DataPublicacao
		  ,[LoginCriacao] = @LoginCriacao
		  ,[StatusAprovacao] = @StatusAprovacao
		  ,[UsuarioAprovacao] = @UsuarioAprovacao
		  ,[CodigoCategoria] = @CodigoCategoria
		  ,[DescricaoCategoria] = @DescricaoCategoria
	 WHERE [CodigoAnuncio] = @CodigoAnuncio
	 
	IF @@ERROR > 0
		ROLLBACK TRAN ATUALIZACAO;
	ELSE
		COMMIT TRAN ATUALIZACAO;
	
END
GO
