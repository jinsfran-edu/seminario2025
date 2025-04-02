CREATE TABLE [dbo].[Medicos] (
    [Matricula] INT          NOT NULL,
    [Nombre]    VARCHAR (50) NULL,
    [Apellido]  VARCHAR (50) NULL,
    [DNI]       VARCHAR (9)  NULL,
    [email]     VARCHAR (50) NULL,
    [celular]   VARCHAR (15) NULL
);
GO

ALTER TABLE [dbo].[Medicos]
    ADD CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED ([Matricula] ASC);
GO

