---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA USUÁRIO ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Usuario](
	[LoginUsuario] [VARCHAR](8) NOT NULL,
	[CpfCnpj] [NUMERIC](14,0) NOT NULL,
	[NomeRazaoSocial] [VARCHAR] (128) NOT NULL,
	[DataNascimento] [DATETIME] NULL,
	[Sexo] [CHAR](1) NULL,
	[TipoPerfil] [VARCHAR](16) NOT NULL
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[LoginUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO