---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA PALPITEBOLAO -----------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('PalpiteJogo') IS NOT NULL 
	DROP TABLE [dbo].PalpiteJogo
GO

CREATE TABLE [dbo].[PalpiteJogo](
	[CodigoPalpite] [INT] IDENTITY(1,1) NOT NULL,
	[codigoJogo] [INT] NOT NULL,
	[LoginUsuario] [VARCHAR](8) NOT NULL,
	[DataAposta] [DATETIME] NOT NULL,
	[PalpiteGolsSelecaoA] [INT] NOT NULL,
	[PalpiteGolsSelecaoB] [INT] NOT NULL
 CONSTRAINT [PK_PalpiteJogo] PRIMARY KEY CLUSTERED 
(
	[CodigoPalpite] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PalpiteJogo]  WITH CHECK ADD  CONSTRAINT [FK_Palpite_Usuario] FOREIGN KEY([LoginUsuario])
REFERENCES [dbo].[Usuario] ([LoginUsuario])
GO

ALTER TABLE [dbo].[PalpiteJogo]  WITH CHECK ADD  CONSTRAINT [FK_Palpite_Jogo] FOREIGN KEY([codigoJogo])
REFERENCES [dbo].[Jogo] ([codigoJogo])
GO
