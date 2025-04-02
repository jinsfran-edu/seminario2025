CREATE TABLE [dbo].[HistoriasClinicas] (
    [NroSala]    INT         NOT NULL,
    [NroCama]    INT         NOT NULL,
    [DNI]        VARCHAR (9) NOT NULL,
    [FechaDesde] DATE        NOT NULL,
    [FechaHasta] DATE        NULL
);
GO

ALTER TABLE [dbo].[HistoriasClinicas]
    ADD CONSTRAINT [FK_HistoriasClinicas_Camas] FOREIGN KEY ([NroSala], [NroCama]) REFERENCES [dbo].[Camas] ([NroSala], [NroCama]);
GO

ALTER TABLE [dbo].[HistoriasClinicas]
    ADD CONSTRAINT [FK_HistoriasClinicas_Pacientes] FOREIGN KEY ([DNI]) REFERENCES [dbo].[Pacientes] ([DNI]);
GO

ALTER TABLE [dbo].[HistoriasClinicas]
    ADD CONSTRAINT [PK_HistoriasClinicas] PRIMARY KEY CLUSTERED ([NroSala] ASC, [NroCama] ASC, [DNI] ASC, [FechaDesde] ASC);
GO

