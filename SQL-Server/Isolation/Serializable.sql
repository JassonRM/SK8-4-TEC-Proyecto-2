-- Example 1 - Query 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
    SELECT *
    FROM Empleado
    WAITFOR DELAY '00:00:15'
    SELECT *
    FROM Empleado
    ROLLBACK

-- Example 2 - Query 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
    SELECT *
    FROM Empleado
    WHERE IdEmpleado BETWEEN 1 AND 24
    WAITFOR DELAY '00:00:15'
    SELECT *
    FROM Empleado
    WHERE IdEmpleado BETWEEN 1 AND 24
    ROLLBACK

-- Query 2
INSERT INTO Empleado(IdEmpleado, IdPersona, IdPuesto, IdSucursal, Salario, Fecha, IdEstado)
VALUES (25, 1, 1, 1, 600000, '2005-08-12', 1);