CREATE TABLE [dbo].[Posto]
(
	[Id] INT NOT NULL , 
    [CNPJ] NCHAR(10) NULL, 
    [NomeFantasia] NCHAR(30) NULL, 
    [RazaoSocial] NCHAR(20) NULL, 
    [Bandeira] NCHAR(20) NULL, 
    [EnderecoId] INT NOT NULL, 
    [UltimaFotoId] INT NOT NULL, 
    [DataInclusao] DATE NULL, 
    [Situacao] NCHAR(20) NULL, 
    [Ocorrencia] NCHAR(20) NULL, 
    [Anotacao] NCHAR(100) NULL, 
    [PostoId] INT NOT NULL, 
    PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Posto_ToTable_Endereco] FOREIGN KEY ([EnderecoId]) REFERENCES [Endereco]([Id]), 
    CONSTRAINT [FK_Posto_ToTable_FotoPosto] FOREIGN KEY ([UltimaFotoId]) REFERENCES [FotoPosto]([Id]), 
    CONSTRAINT [FK_Posto_ToTable_Pedido] FOREIGN KEY ([PostoId]) REFERENCES [Pedido]([ClienteName]) 

)

GO
