CREATE TABLE [dbo].[Camas] (
    [NroSala]   INT          NOT NULL,
    [NroCama]   INT          NOT NULL,
    [Categoria] VARCHAR (50) NULL
);
GO

ALTER TABLE [dbo].[Camas]
    ADD CONSTRAINT [PK_Camas] PRIMARY KEY CLUSTERED ([NroSala] ASC, [NroCama] ASC);
GO

ALTER TABLE [dbo].[Camas]
    ADD CONSTRAINT [FK_Camas_Salas] FOREIGN KEY ([NroSala]) REFERENCES [dbo].[Salas] ([NroSala]);
GO

