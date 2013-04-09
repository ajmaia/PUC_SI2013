---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA PROCEDURE PR_EDITAR_NOTICIA ---------------------------------------------------
---------------------------------------------------------------------------------------------

USE [BRAZUCAS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID ( 'PR_EDITAR_NOTICIA', 'P' ) IS NOT NULL 
    DROP PROCEDURE PR_EDITAR_NOTICIA;
GO

CREATE PROCEDURE PR_EDITAR_NOTICIA
	@CodigoNoticia [INT],
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
	
	BEGIN TRAN ATUALIZACAO;
	
	UPDATE [BRAZUCAS].[dbo].[Noticia]
	   SET [Titulo] = @Titulo
		  ,[CaminhoImagem] = @CaminhoImagem
		  ,[Conteudo] = @Conteudo
		  ,[DataPublicacao] = @DataPublicacao
		  ,[Autor] = @Autor
		  ,[CodigoCategoria] = @CodigoCategoria
		  ,[DescricaoCategoria] = @DescricaoCategoria
	WHERE [CodigoNoticia] = @CodigoNoticia
	 
	IF @@ERROR > 0
		ROLLBACK TRAN ATUALIZACAO;
	ELSE
		COMMIT TRAN ATUALIZACAO;
	
END
GO
