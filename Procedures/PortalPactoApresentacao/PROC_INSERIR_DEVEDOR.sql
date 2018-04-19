USE [PortalPactoApresentacao]
GO
/****** Object:  StoredProcedure [dbo].[PROC_INSERIR_DEVEDOR_E_ENDERECO]    Script Date: 18/04/2018 17:46:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Araujo Lucas>
-- Create date: <18/04/2018>
-- Description:	<Inserir todos os dados de um devedor, nas tabelas "SMP_Devedor" e "SMP_Endereco">
-- =============================================
ALTER PROCEDURE [dbo].[PROC_INSERIR_DEVEDOR_E_ENDERECO] 
	-- Tabela "SMP_Devedor"
	@Senha VARCHAR(200),
	@Nome VARCHAR(200),
	@RG VARCHAR(20),
	@CPF VARCHAR(20),
	@DataNascimento DATETIME,
	@Genero CHAR(1),
	@EstadoCivil CHAR(1),
	@DataCriacao DATETIME,
	@DataEdicao DATETIME,
	@PrimeiroCadastro DATETIME,	
	-- Tabela "SMP_Endereco"
	@IdDevedor INT,
	@Logradouro VARCHAR(200),
	@Numero VARCHAR(20),
	@Complemento VARCHAR(100),
	@Bairro VARCHAR(100),
	@Municipio VARCHAR(200),
	@UF VARCHAR(2),
	@CEP VARCHAR(10)

AS
	SET NOCOUNT ON;
	
	INSERT INTO dbo.SMP_Devedor (
		Senha,
		Nome,
		RG,
		CPF,
		DataNascimento,
		Genero,
		EstadoCivil,
		DataCriacao,
		DataEdicao,
		PrimeiroCadastro
	) 
	VALUES(
		@Senha,
		@Nome,
		@RG,
		@CPF,
		@DataNascimento,
		@Genero,
		@EstadoCivil,
		@DataCriacao,
		@DataEdicao,
		@PrimeiroCadastro
	)
	GO 
	set @IdDevedor 	= SCOPE_IDENTITY();
	GO
	INSERT INTO dbo.SMP_Endereco (
		IdDevedor,
		Logradouro,
		Numero,
		Complemento,
		Bairro,
		Municipio,
		UF,
		CEP
	) 
	VALUES(
		@IdDevedor,
		@Logradouro,
		@Numero,
		@Complemento,
		@Bairro,
		@Municipio,
		@UF,
		@CEP
	)

	