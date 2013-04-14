---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA VW_INGRESSO ------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

IF OBJECT_ID ('Ingresso') IS NOT NULL 
	DROP VIEW [dbo].Ingresso
GO

CREATE VIEW [dbo].[Ingresso]
AS

SELECT
	[CodigoJogo],
	[NomeCidade],
	[LocalVendaIngresso],
	[Rodada],
	[CodigoSelecaoA],
	[NomeSelecaoA],
	[CodigoSelecaoB],
	[NomeSelecaoB],
	[DataHora]
FROM  [dbo].[Jogo]
GO