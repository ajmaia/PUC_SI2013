---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA PROCEDURE PR_INSERIR_NOTICIA --------------------------------------------------
---------------------------------------------------------------------------------------------

USE [BRAZUCAS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID ( 'PR_INSERIR_NOTICIA', 'P' ) IS NOT NULL 
    DROP PROCEDURE PR_INSERIR_NOTICIA;
GO

CREATE PROCEDURE PR_INSERIR_NOTICIA
	@Titulo [VARCHAR](128),
	@CaminhoImagem [VARCHAR](128),
	@Conteudo [TEXT],
	@DataPublicacao [DATETIME],
	@Autor [VARCHAR](128),
	@CodigoCategoria [INT],
	@DescricaoCategoria [VARCHAR](128)
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRAN INSERCAO;
	
	INSERT INTO [BRAZUCAS].[dbo].[Noticia]
	     VALUES (@Titulo
				,@CaminhoImagem
				,@Conteudo
				,@DataPublicacao
				,@Autor
				,@CodigoCategoria
				,@DescricaoCategoria)
	
	 
	IF @@ERROR > 0
		ROLLBACK TRAN INSERCAO;
	ELSE
		COMMIT TRAN INSERCAO;
	
END
GO
