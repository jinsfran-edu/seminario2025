CREATE TABLE [dbo].[Especialidades] (
    [Cod-Esp]     INT          IDENTITY (1, 1) NOT NULL,
    [Descripcion] VARCHAR (50) NULL,
    [Abreviatura] VARCHAR (10) NULL
);
GO

ALTER TABLE [dbo].[Especialidades]
    ADD CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED ([Cod-Esp] ASC);
GO

