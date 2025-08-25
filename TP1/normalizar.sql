USE Empleados;
CREATE TABLE puesto_descr (
id_puesto SMALLINT IDENTITY NOT NULL,
puesto VARCHAR(50) NOT NULL,
puesto_es VARCHAR(50),
CONSTRAINT PK_puesto_descr PRIMARY KEY (id_puesto)
);
GO
INSERT INTO puesto_descr (puesto)
SELECT DISTINCT puesto
FROM puestos;
GO
ALTER TABLE puestos ADD id_puesto SMALLINT;
GO
UPDATE puestos SET id_puesto = pd.id_puesto 
FROM puestos p JOIN puesto_descr pd
ON p.puesto=pd.puesto;
GO
ALTER TABLE puestos DROP CONSTRAINT PK_puestos;
ALTER TABLE puestos DROP COLUMN puesto;
ALTER TABLE puestos ALTER COLUMN id_puesto SMALLINT NOT NULL;
ALTER TABLE puestos ADD CONSTRAINT PK_puestos PRIMARY KEY (id_emp, id_puesto, fecha_desde);
ALTER TABLE puestos ADD CONSTRAINT FK_puestos_puesto_descr FOREIGN KEY (id_puesto) REFERENCES puesto_descr(id_puesto);
GO