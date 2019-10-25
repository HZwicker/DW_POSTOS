CREATE TABLE [dbo].[Endereco]
(
	[Id] INT NOT NULL PRIMARY KEY,   
    [Logradouro] NCHAR(30) NULL, 
    [Complemento] NCHAR(30) NULL, 
    [CEP] NCHAR(8) NULL, 
	[Cidade] NCHAR(30) NULL, 
    [UF] NCHAR(2) NULL,  
    [Latitude] FLOAT NULL, 
    [Longitude] FLOAT NULL, 
	
)
