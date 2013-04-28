---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA GRUPO ------------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Grupo') IS NOT NULL 
	DROP TABLE [dbo].Grupo
GO

CREATE TABLE [dbo].[Grupo](
	[CodigoGrupo] [INT] IDENTITY(1,1) NOT NULL,
	[DescricaoGrupo] [VARCHAR] (128) NOT NULL
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED ([CodigoGrupo] ASC)
 );
GO