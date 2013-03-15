---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA HISTORIASELECAO --------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[HistoriaSelecao](
	[CodigoHistoria] [INT] IDENTITY(1,1) NOT NULL,
	[DescricaoHistoria] [TEXT] NULL,
	[CaminhoImagem] [VARCHAR](128) NULL,
	[CodigoSelecao] [INT] NOT NULL
 CONSTRAINT [PK_HistoriaSelecao] PRIMARY KEY CLUSTERED 
(
	[CodigoHistoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[HistoriaSelecao]  WITH CHECK ADD  CONSTRAINT [FK_Historia_Selecao] FOREIGN KEY([CodigoSelecao])
REFERENCES [dbo].[Selecao] ([CodigoSelecao])
GO