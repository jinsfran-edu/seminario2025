CREATE TABLE [dbo].[ObrasSociales] (
    [Cod-OS]   INT          IDENTITY (1, 1) NOT NULL,
    [NombreOS] VARCHAR (50) NULL,
    [web]      VARCHAR (50) NULL
);
GO

ALTER TABLE [dbo].[ObrasSociales]
    ADD CONSTRAINT [PK_ObrasSociales] PRIMARY KEY CLUSTERED ([Cod-OS] ASC);
GO

