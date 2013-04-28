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
 CONSTRAINT [PK_PalpiteJogo] PRIMARY KEY CLUSTERED ([CodigoPalpite] ASC),
 CONSTRAINT [FK_Palpite_Usuario] FOREIGN KEY([LoginUsuario])
	REFERENCES [dbo].[Usuario] ([LoginUsuario])
		ON DELETE CASCADE,
 CONSTRAINT [FK_Palpite_Jogo] FOREIGN KEY([codigoJogo])
	REFERENCES [dbo].[Jogo] ([codigoJogo])
		ON DELETE CASCADE
);
GO
