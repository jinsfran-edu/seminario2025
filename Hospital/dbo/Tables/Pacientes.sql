CREATE TABLE [dbo].[Pacientes] (
    [DNI]      VARCHAR (9)  NOT NULL,
    [Nombre]   VARCHAR (50) NULL,
    [Apellido] VARCHAR (50) NULL,
    [email]    VARCHAR (50) NULL,
    [celular]  VARCHAR (15) NULL,
    [Cod-OS]   INT          NULL
);
GO

ALTER TABLE [dbo].[Pacientes]
    ADD CONSTRAINT [FK_Pacientes_ObrasSociales] FOREIGN KEY ([Cod-OS]) REFERENCES [dbo].[ObrasSociales] ([Cod-OS]);
GO

ALTER TABLE [dbo].[Pacientes]
    ADD CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED ([DNI] ASC);
GO

