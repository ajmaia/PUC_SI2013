USE [BRAZUCAS]
GO

CREATE TABLE dbo.Usuario
	(
	Login varchar(8) NOT NULL,
	CnpjCpf numeric(14, 0) NOT NULL,
	Nome varchar(128) NOT NULL,
	Email varchar(52) NULL,
	Telefone numeric(10, 0) NULL,
	DataNascimento datetime NULL,
	Sexo char(1) NULL,
	Senha varchar(24) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Usuario ADD CONSTRAINT
	PK_Usuario PRIMARY KEY CLUSTERED 
	(
	Login
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Usuario SET (LOCK_ESCALATION = TABLE)
GO