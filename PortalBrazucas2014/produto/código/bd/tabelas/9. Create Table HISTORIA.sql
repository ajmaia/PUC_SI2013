---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA HISTORIA ---------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Historia') IS NOT NULL 
	DROP TABLE [dbo].Historia
GO

CREATE TABLE [dbo].[Historia](
	[CodigoHistoria] [INT] IDENTITY(1,1) NOT NULL,
	[HistoriaSelecao] [TEXT] NULL,
	[Pais] [VARCHAR](16) NOT NULL,
	[HistoriaPais] [TEXT] NULL,
	[CaminhoImagem] [VARCHAR](128) NULL,
	[RankingFIFA] [INT] NOT NULL,
	[TitulosConquistados] [VARCHAR](128) NULL
 CONSTRAINT [PK_HistoriaSelecao] PRIMARY KEY CLUSTERED 
(
	[CodigoHistoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO