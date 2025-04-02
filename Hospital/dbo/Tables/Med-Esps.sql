CREATE TABLE [dbo].[Med-Esps] (
    [Cod-Esp]   INT NOT NULL,
    [Matricula] INT NOT NULL
);
GO

ALTER TABLE [dbo].[Med-Esps]
    ADD CONSTRAINT [PK_MedEsps] PRIMARY KEY CLUSTERED ([Cod-Esp] ASC, [Matricula] ASC);
GO

ALTER TABLE [dbo].[Med-Esps]
    ADD CONSTRAINT [FK_MedEsps_Especialidades] FOREIGN KEY ([Cod-Esp]) REFERENCES [dbo].[Especialidades] ([Cod-Esp]);
GO

ALTER TABLE [dbo].[Med-Esps]
    ADD CONSTRAINT [FK_MedEsps_Medicos] FOREIGN KEY ([Matricula]) REFERENCES [dbo].[Medicos] ([Matricula]);
GO

