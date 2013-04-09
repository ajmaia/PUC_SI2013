---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA CATEGORIA --------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Categoria](
	[CodigoCategoria] [INT] IDENTITY(1,1) NOT NULL,
	[DescricaoCategoria] [VARCHAR] (128) NOT NULL
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[CodigoCategoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO