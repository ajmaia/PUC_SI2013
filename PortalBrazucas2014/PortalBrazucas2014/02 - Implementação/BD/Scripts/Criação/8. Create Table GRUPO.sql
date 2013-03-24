---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA GRUPO ------------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Grupo](
	[CodigoGrupo] [INT] IDENTITY(1,1) NOT NULL,
	[DescricaoGrupo] [VARCHAR] (128) NOT NULL
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[CodigoGrupo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO