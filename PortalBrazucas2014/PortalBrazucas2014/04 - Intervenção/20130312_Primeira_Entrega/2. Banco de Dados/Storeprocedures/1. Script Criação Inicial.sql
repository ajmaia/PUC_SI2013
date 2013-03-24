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
