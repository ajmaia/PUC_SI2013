---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA PROCEDURE PR_INSERIR_ANUNCIO --------------------------------------------------
---------------------------------------------------------------------------------------------

USE [BRAZUCAS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID ( 'PR_INSERIR_ANUNCIO', 'P' ) IS NOT NULL 
    DROP PROCEDURE PR_INSERIR_ANUNCIO;
GO

CREATE PROCEDURE PR_INSERIR_ANUNCIO
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
	
	BEGIN TRAN INSERCAO;
	
	INSERT INTO [BRAZUCAS].[dbo].[Anuncio]
	     VALUES (@Titulo
				,@CaminhoImagem
				,@Conteudo
				,@DataPublicacao
				,@LoginCriacao
				,@StatusAprovacao
				,@UsuarioAprovacao
				,@CodigoCategoria
				,@DescricaoCategoria)
	 
	IF @@ERROR > 0
		ROLLBACK TRAN INSERCAO;
	ELSE
		COMMIT TRAN INSERCAO;
	
END
GO
