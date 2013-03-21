---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA HISTORIA ---------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Historia](
	[CodigoHistoria] [INT] IDENTITY(1,1) NOT NULL,
	[HistoriaSelecao] [TEXT] NULL,
	[Pais] [VARCHAR](16) NOT NULL,
	[HistoriaPais] [TEXT] NULL,
	[CaminhoImagem] [VARCHAR](128) NULL,
	[RankingFIFA] [INT] NOT NULL,
	[QuantidadeJogosHistorico] [INT] NULL,
	[VitoriasHistorico] [INT] NULL,
	[EmpatesHistorico] [INT] NULL,
	[DerrotasHistorico] [INT] NULL,
	[GolsRealizadosHistorico] [INT] NULL,
	[GolsSofridosHistorico] [INT] NULL
 CONSTRAINT [PK_HistoriaSelecao] PRIMARY KEY CLUSTERED 
(
	[CodigoHistoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO