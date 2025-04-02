CREATE TABLE [dbo].[Salas] (
    [NroSala]     INT          NOT NULL,
    [Descripcion] VARCHAR (50) NULL
);
GO

ALTER TABLE [dbo].[Salas]
    ADD CONSTRAINT [PK_Salas] PRIMARY KEY CLUSTERED ([NroSala] ASC);
GO

