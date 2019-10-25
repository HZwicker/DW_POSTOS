﻿/*
Deployment script for DW_POSTOS

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_POSTOS"
:setvar DefaultFilePrefix "DW_POSTOS"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
The column [dbo].[Pedido].[PostoId] is being dropped, data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[Pedido])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The column [dbo].[Posto].[PostoId] on table [dbo].[Posto] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Posto])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Dropping [dbo].[FK_Pedido_ToTable_Posto]...';


GO
ALTER TABLE [dbo].[Pedido] DROP CONSTRAINT [FK_Pedido_ToTable_Posto];


GO
PRINT N'Altering [dbo].[Pedido]...';


GO
ALTER TABLE [dbo].[Pedido] DROP COLUMN [PostoId];


GO
PRINT N'Altering [dbo].[Posto]...';


GO
ALTER TABLE [dbo].[Posto]
    ADD [PostoId] INT NOT NULL;


GO
PRINT N'Creating [dbo].[FK_Posto_ToTable_Pedido]...';


GO
ALTER TABLE [dbo].[Posto] WITH NOCHECK
    ADD CONSTRAINT [FK_Posto_ToTable_Pedido] FOREIGN KEY ([PostoId]) REFERENCES [dbo].[Pedido] ([ClienteName]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Posto] WITH CHECK CHECK CONSTRAINT [FK_Posto_ToTable_Pedido];


GO
PRINT N'Update complete.';


GO