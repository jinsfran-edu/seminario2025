USE master;
DROP DATABASE IF EXISTS HOSPITAL;
GO
CREATE DATABASE HOSPITAL;
GO
USE HOSPITAL;
GO
CREATE TABLE Medicos (
    Matricula INT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    DNI VARCHAR(9),
    email VARCHAR(50),
    celular VARCHAR(15),
    CONSTRAINT PK_Medicos PRIMARY KEY (Matricula)
);
GO
CREATE TABLE Especialidades (
    [Cod-Esp] INT IDENTITY(1,1),
    Descripcion VARCHAR(50),
    Abreviatura VARCHAR(10),
    CONSTRAINT PK_Especialidades PRIMARY KEY ([Cod-Esp])
);
GO
CREATE TABLE [Med-Esps] (
    [Cod-Esp] INT,
    Matricula INT,
    CONSTRAINT PK_MedEsps PRIMARY KEY ([Cod-Esp], Matricula),
    CONSTRAINT FK_MedEsps_Especialidades FOREIGN KEY ([Cod-Esp]) REFERENCES Especialidades([Cod-Esp]),
    CONSTRAINT FK_MedEsps_Medicos FOREIGN KEY (Matricula) REFERENCES Medicos(Matricula)
);
GO
CREATE TABLE Salas (
    NroSala INT,
    Descripcion VARCHAR(50),
    CONSTRAINT PK_Salas PRIMARY KEY (NroSala)
);
GO
CREATE TABLE Camas (
    NroSala INT,
    NroCama INT,
    Categoria VARCHAR(50),
    CONSTRAINT PK_Camas PRIMARY KEY (NroSala, NroCama),
    CONSTRAINT FK_Camas_Salas FOREIGN KEY (NroSala) REFERENCES Salas(NroSala)
);
GO
CREATE TABLE ObrasSociales (
    [Cod-OS] INT IDENTITY(1,1),
    NombreOS VARCHAR(50),
    web VARCHAR(50),
    CONSTRAINT PK_ObrasSociales PRIMARY KEY ([Cod-OS])
);
GO
CREATE TABLE Pacientes (
    DNI VARCHAR(9),
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    email VARCHAR(50),
    celular VARCHAR(15),
    [Cod-OS] INT,
    CONSTRAINT PK_Pacientes PRIMARY KEY (DNI),
    CONSTRAINT FK_Pacientes_ObrasSociales FOREIGN KEY ([Cod-OS]) REFERENCES ObrasSociales([Cod-OS])
);
GO
CREATE TABLE HistoriasClinicas (
    NroSala INT,
    NroCama INT,
    DNI VARCHAR(9),
    FechaDesde DATE,
    FechaHasta DATE,
    CONSTRAINT PK_HistoriasClinicas PRIMARY KEY (NroSala, NroCama, DNI, FechaDesde),
    CONSTRAINT FK_HistoriasClinicas_Camas FOREIGN KEY (NroSala, NroCama) REFERENCES Camas(NroSala, NroCama),
    CONSTRAINT FK_HistoriasClinicas_Pacientes FOREIGN KEY (DNI) REFERENCES Pacientes(DNI)
);
GO
CREATE TABLE Horarios (
    NroSala INT,
    Matricula INT,
    [Cod-Esp] INT,
    FechaDesde DATE,
    Dia VARCHAR(10),
    Horario VARCHAR(10),
    CONSTRAINT PK_Horarios PRIMARY KEY (NroSala, Matricula, [Cod-Esp], FechaDesde),
    CONSTRAINT FK_Horarios_Salas FOREIGN KEY (NroSala) REFERENCES Salas(NroSala),
    CONSTRAINT FK_Horarios_Medicos FOREIGN KEY (Matricula) REFERENCES Medicos(Matricula),
    CONSTRAINT FK_Horarios_Especialidades FOREIGN KEY ([Cod-Esp]) REFERENCES Especialidades([Cod-Esp])
);
GO
