-- Query 1
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
BEGIN TRAN
    SELECT *
    FROM Empleado
    WAITFOR DELAY '00:00:15'
    SELECT *
    FROM Empleado
    ROLLBACK

-- Query 2
INSERT INTO Empleado(IdEmpleado, IdPersona, IdPuesto, IdSucursal, Salario, Fecha, IdEstado)
VALUES (25, 1, 1, 1, 600000, '2005-08-12', 1)
UPDATE Empleado
SET Salario = 990000
WHERE IdEmpleado = 4
SELECT *
FROM Empleado;