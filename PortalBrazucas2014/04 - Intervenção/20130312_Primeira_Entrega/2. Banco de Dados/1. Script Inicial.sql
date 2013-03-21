---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA BASE DE DADOS -----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE master;
GO

IF DB_ID (N'BRAZUCAS') IS NOT NULL
DROP DATABASE BRAZUCAS;
GO
CREATE DATABASE BRAZUCAS;
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA USUÁRIO ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Usuario](
	[LoginUsuario] [VARCHAR](8) NOT NULL,
	[CpfCnpj] [NUMERIC](14,0) NOT NULL,
	[NomeRazaoSocial] [VARCHAR] (128) NOT NULL,
	[Email] [VARCHAR] (128) NOT NULL,
	[DataNascimento] [DATETIME] NULL,
	[Sexo] [CHAR](1) NULL,
	[TipoPerfil] [VARCHAR](16) NOT NULL
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[LoginUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

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

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA ANUNCIO ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Anuncio](
	[CodigoAnuncio] [INT] IDENTITY(1,1) NOT NULL,
	[Titulo] [VARCHAR] (128) NOT NULL,
	[CaminhoImagem] [VARCHAR] (128) NULL,
	[Conteudo] [VARCHAR] (128) NOT NULL,
	[DataPublicacao] [DATETIME] NOT NULL,
	[LoginCriacao] [VARCHAR](8) NOT NULL,
	[StatusAprovacao] [CHAR](1) NULL,
	[UsuarioAprovacao] [VARCHAR](8) NULL,
	[CodigoCategoria] [INT] NOT NULL,
	[DescricaoCategoria] [VARCHAR] (128) NOT NULL
 CONSTRAINT [PK_Anuncio] PRIMARY KEY CLUSTERED 
(
	[CodigoAnuncio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Anuncio]  WITH CHECK ADD  CONSTRAINT [FK_Anuncio_Categoria] FOREIGN KEY([CodigoCategoria])
REFERENCES [dbo].[Categoria] ([CodigoCategoria])
GO

ALTER TABLE [dbo].[Anuncio]  WITH CHECK ADD  CONSTRAINT [FK_Anuncio_Usuario] FOREIGN KEY([LoginCriacao])
REFERENCES [dbo].[Usuario] ([LoginUsuario])
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA NOTÍCIA ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Noticia](
	[CodigoNoticia] [INT] IDENTITY(1,1) NOT NULL,
	[Titulo] [VARCHAR] (128) NOT NULL,
	[CaminhoImagem] [VARCHAR] (128) NULL,
	[Conteudo] [VARCHAR] (128) NOT NULL,
	[DataPublicacao] [DATETIME] NOT NULL,
	[Autor] [VARCHAR] (128) NOT NULL,
	[CodigoCategoria] [INT] NOT NULL,
	[DescricaoCategoria] [VARCHAR] (128) NOT NULL,
 CONSTRAINT [PK_Noticia] PRIMARY KEY CLUSTERED 
(
	[CodigoNoticia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Noticia]  WITH CHECK ADD  CONSTRAINT [FK_Noticia_Categoria] FOREIGN KEY([CodigoCategoria])
REFERENCES [dbo].[Categoria] ([CodigoCategoria])
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA COMENTÁRIO -------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Comentario](
	[CodigoComentario] [INT] IDENTITY(1,1) NOT NULL,
	[Conteudo] [TEXT] NOT NULL,
	[LoginCriacao] [VARCHAR](8) NOT NULL,
	[NomeLoginCriacao] [VARCHAR](128) NOT NULL,
	[DataCriacao] [DATETIME] NOT NULL,
	[StatusAprovacao] [CHAR](1) NULL,
	[UsuarioAprovacao] [VARCHAR](8) NULL,
	[CodigoNoticia] [INT] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[CodigoComentario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Noticia] FOREIGN KEY([CodigoNoticia])
REFERENCES [dbo].[Noticia] ([CodigoNoticia])
GO

ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Usuario] FOREIGN KEY([LoginCriacao])
REFERENCES [dbo].[Usuario] ([LoginUsuario])
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA CIDADE -----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Cidade](
	[CodigoCidade] [INT] IDENTITY(1,1) NOT NULL,
	[Nome] [VARCHAR](128) NOT NULL,
	[UF] [CHAR](2) NOT NULL,
	[CaminhoImagem] [VARCHAR](128) NULL,
	[NomeEstadio] [VARCHAR](128) NULL,
	[CapacidadeEstadio] [INT] NULL,
	[InformacoesEstadio][VARCHAR](128) NULL
 CONSTRAINT [PK_Cidade] PRIMARY KEY CLUSTERED 
(
	[CodigoCidade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

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

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA SELECAO ----------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Selecao](
	[CodigoSelecao] [INT] IDENTITY(1,1) NOT NULL,
	[Nome] [VARCHAR](128) NOT NULL,
	[Pais] [VARCHAR](16) NOT NULL,
	[CaminhoImagem] [VARCHAR](128) NULL,
	[CodigoGrupo] [INT] NOT NULL,
	[DescricaoGrupo] [VARCHAR] (128) NOT NULL,
	[QuantidadeJogos] [INT] NULL,
	[Vitorias] [INT] NULL,
	[Empates] [INT] NULL,
	[Derrotas] [INT] NULL,
	[GolsRealizados] [INT] NULL,
	[GolsSofridos] [INT] NULL,
	[CodigoHistoria] [INT] NOT NULL
 CONSTRAINT [PK_Selecao] PRIMARY KEY CLUSTERED 
(
	[CodigoSelecao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Selecao]  WITH CHECK ADD  CONSTRAINT [FK_Selecao_Grupo] FOREIGN KEY([CodigoSelecao])
REFERENCES [dbo].[Grupo] ([CodigoGrupo])
GO

ALTER TABLE [dbo].[Selecao]  WITH CHECK ADD  CONSTRAINT [FK_Selecao_Historia] FOREIGN KEY([CodigoHistoria])
REFERENCES [dbo].[Historia] ([CodigoHistoria])
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA VW_DESEMPENHOSELECAO ---------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE VIEW [dbo].[DesempenhoSelecao]
AS

SELECT
	His.[RankingFIFA],
	Sel.[Nome],
	Sel.[Pais],
	Sel.[CaminhoImagem],
	His.[QuantidadeJogosHistorico],
	His.[VitoriasHistorico],
	His.[EmpatesHistorico],
	His.[DerrotasHistorico],
	His.[GolsRealizadosHistorico],
	His.[GolsSofridosHistorico]
FROM [dbo].[Selecao] AS Sel
INNER JOIN [dbo].[Historia] AS His ON His.[CodigoHistoria] = Sel.[CodigoHistoria]
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA JOGO -------------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[Jogo](
	[CodigoJogo] [INT] IDENTITY(1,1) NOT NULL,
	[CodigoCidade] [INT] NOT NULL,
	[NomeCidade] [VARCHAR](128) NOT NULL,
	[LocalVendaIngresso] [VARCHAR] (128) NULL,
	[Rodada] [INT] NOT NULL,
	[CodigoSelecaoA] [INT] NOT NULL,
	[NomeSelecaoA] [VARCHAR](128) NOT NULL,
	[GolsSelecaoA] [INT] NULL,
	[CodigoSelecaoB] [INT] NOT NULL,
	[NomeSelecaoB] [VARCHAR](128) NOT NULL,
	[GolsSelecaoB] [INT] NULL,
	[DataHora] [DATETIME] NOT NULL,
	[CaminhoImagem] [VARCHAR](128) NULL
 CONSTRAINT [PK_Jogo] PRIMARY KEY CLUSTERED 
(
	[CodigoJogo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Jogo]  WITH CHECK ADD  CONSTRAINT [FK_Jogo_SelecaoA] FOREIGN KEY([CodigoSelecaoA])
REFERENCES [dbo].[Selecao] ([CodigoSelecao])
GO

ALTER TABLE [dbo].[Jogo]  WITH CHECK ADD  CONSTRAINT [FK_Jogo_SelecaoB] FOREIGN KEY([CodigoSelecaoB])
REFERENCES [dbo].[Selecao] ([CodigoSelecao])
GO

ALTER TABLE [dbo].[Jogo]  WITH CHECK ADD  CONSTRAINT [FK_Jogo_Cidade] FOREIGN KEY([CodigoCidade])
REFERENCES [dbo].[Cidade] ([CodigoCidade])
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA PALPITEBOLAO -----------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
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

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA PONTUACAOBOLAO ---------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE TABLE [dbo].[PontuacaoBolao](
	[CodigoBolao] [INT] IDENTITY(1,1) NOT NULL,
	[LoginUsuario] [VARCHAR](8) NOT NULL,
	[NomeRazaoSocial] [VARCHAR] (128) NOT NULL,
	[AcertosPlacarCompleto] [INT] NULL,
	[AcertosResultadoPlacarParcial] [INT] NULL,
	[AcertosResultado] [INT] NULL,
	[RankingBolao] [INT] NULL
 CONSTRAINT [PK_PontuacaoBolao] PRIMARY KEY CLUSTERED 
(
	[CodigoBolao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PontuacaoBolao]  WITH CHECK ADD  CONSTRAINT [FK_Pontuacao_Usuario] FOREIGN KEY([LoginUsuario])
REFERENCES [dbo].[Usuario] ([LoginUsuario])
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA VW_BOLAO ---------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE VIEW [dbo].[Bolao]
AS

SELECT
	[RankingBolao],
	[LoginUsuario],
	[NomeRazaoSocial],
	(
		[AcertosPlacarCompleto] +
		[AcertosResultadoPlacarParcial] +
		[AcertosResultado]
	) AS [Pontuacao],
	(
		(
			SELECT	PRI.[AcertosPlacarCompleto] +
					PRI.[AcertosResultadoPlacarParcial] +
					PRI.[AcertosResultado]
			FROM [dbo].[PontuacaoBolao] AS PRI
			WHERE PRI.[RankingBolao] = 1
		) -
		(
			[AcertosPlacarCompleto] +
			[AcertosResultadoPlacarParcial] +
			[AcertosResultado]
		)
	) AS [RelativoPrimeiroColocado],
	(
		(
			SELECT	PRI.[AcertosPlacarCompleto] +
					PRI.[AcertosResultadoPlacarParcial] +
					PRI.[AcertosResultado]
			FROM [dbo].[PontuacaoBolao] AS PRI
			WHERE PRI.[RankingBolao] = [RankingBolao] - 1
		) -
		(
			[AcertosPlacarCompleto] +
			[AcertosResultadoPlacarParcial] +
			[AcertosResultado]
		)
	) AS [RelativoColocadoAnterior]
FROM [dbo].[PontuacaoBolao]
GO

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA VW_INGRESSO ------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
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

---------------------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELA VW_RODADA --------------------------------------------------------------
---------------------------------------------------------------------------------------------

USE BRAZUCAS
GO

CREATE VIEW [dbo].[Rodada]
AS

SELECT
	[Rodada],
	[Fase],
	[CodigoSelecao],
	[NomeSelecao],
	[CodigoGrupo],
	SUM([Empates])			AS [Empates],
	SUM([Vitorias])			AS [Vitorias],
	SUM([Derrotas])			AS [Derrotas],
	SUM([GolsRealizados])	AS [GolsRealizados],
	SUM([GolsSofridos])		AS [GolsSofridos]
FROM 
(
	SELECT 
		[Rodada],
		(CASE WHEN SelA.[CodigoGrupo] = SelB.[CodigoGrupo] THEN 'Grupos' 
			  ELSE 'Eliminatórias' END)	AS [Fase],
		SelA.[CodigoSelecao],
		SelA.[Nome] AS [NomeSelecao],
		SelA.[CodigoGrupo],
		(CASE WHEN [GolsSelecaoA] = [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Empates],
		(CASE WHEN [GolsSelecaoA] > [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Vitorias],
		(CASE WHEN [GolsSelecaoA] < [GolsSelecaoB] THEN 1 ELSE 0 END) AS [Derrotas],
		[GolsSelecaoA] AS [GolsRealizados],
		[GolsSelecaoB] AS [GolsSofridos]
	FROM [dbo].[Jogo] (NOLOCK)
	INNER JOIN [dbo].[Selecao] AS SelA (NOLOCK) ON [CodigoSelecaoA] = SelA.[CodigoSelecao]
	INNER JOIN [dbo].[Selecao] AS SelB (NOLOCK) ON [CodigoSelecaoB] = SelB.[CodigoSelecao]
	
	UNION ALL
	
	SELECT 
		[Rodada],
		(CASE WHEN SelA.[CodigoGrupo] = SelB.[CodigoGrupo] THEN 'Grupos' 
			  ELSE 'Eliminatórias' END)	AS [Fase],
		SelB.[CodigoSelecao],
		SelB.[Nome] AS [NomeSelecao],
		SelB.[CodigoGrupo],
		(CASE WHEN [GolsSelecaoB] = [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Empates],
		(CASE WHEN [GolsSelecaoB] > [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Vitorias],
		(CASE WHEN [GolsSelecaoB] < [GolsSelecaoA] THEN 1 ELSE 0 END) AS [Derrotas],
		[GolsSelecaoB] AS [GolsRealizados],
		[GolsSelecaoA] AS [GolsSofridos]
	FROM [dbo].[Jogo] (NOLOCK)
	INNER JOIN [dbo].[Selecao] AS SelA (NOLOCK) ON [CodigoSelecaoA] = SelA.[CodigoSelecao]
	INNER JOIN [dbo].[Selecao] AS SelB (NOLOCK) ON [CodigoSelecaoB] = SelB.[CodigoSelecao]
) AS [TabelaAux]
GROUP BY [Rodada]
		,[Fase]
		,[CodigoSelecao]
		,[NomeSelecao]
		,[CodigoGrupo]
GO