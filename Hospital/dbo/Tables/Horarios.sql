CREATE TABLE [dbo].[Horarios] (
    [NroSala]    INT          NOT NULL,
    [Matricula]  INT          NOT NULL,
    [Cod-Esp]    INT          NOT NULL,
    [FechaDesde] DATE         NOT NULL,
    [Dia]        VARCHAR (10) NULL,
    [Horario]    VARCHAR (10) NULL
);
GO

ALTER TABLE [dbo].[Horarios]
    ADD CONSTRAINT [PK_Horarios] PRIMARY KEY CLUSTERED ([NroSala] ASC, [Matricula] ASC, [Cod-Esp] ASC, [FechaDesde] ASC);
GO

ALTER TABLE [dbo].[Horarios]
    ADD CONSTRAINT [FK_Horarios_Salas] FOREIGN KEY ([NroSala]) REFERENCES [dbo].[Salas] ([NroSala]);
GO

ALTER TABLE [dbo].[Horarios]
    ADD CONSTRAINT [FK_Horarios_Medicos] FOREIGN KEY ([Matricula]) REFERENCES [dbo].[Medicos] ([Matricula]);
GO

ALTER TABLE [dbo].[Horarios]
    ADD CONSTRAINT [FK_Horarios_Especialidades] FOREIGN KEY ([Cod-Esp]) REFERENCES [dbo].[Especialidades] ([Cod-Esp]);
GO

