CREATE TYPE CamionTableType AS TABLE
(
    Placa    VARCHAR(40),
    Marca    VARCHAR(40),
    IdEstado INT
);

CREATE PROCEDURE InsertCamion @TVP CamionTableType READONLY AS
INSERT INTO dbo.Camion(Placa, Marca, IdEstado)
SELECT *
FROM @TVP;

DECLARE @CamionTVP AS CamionTableType;

INSERT INTO @CamionTVP (Placa, Marca, IdEstado)
VALUES ('779-PPP', 'Toyota', 1);

EXEC InsertCamion @CamionTVP;