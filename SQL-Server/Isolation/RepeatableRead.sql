-- Query 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
    SELECT *
    FROM Empleado
    WHERE IdEmpleado in(1,2)
    WAITFOR DELAY '00:00:15'
    SELECT *
    FROM Empleado
    WHERE IdEmpleado in(1,2)
    ROLLBACK

-- Example 1 - Query 2
UPDATE Empleado
SET Salario = 2200000
WHERE IdEmpleado = 1;

-- Example 2 - Query 2
UPDATE Empleado
SET Salario = 2200000
WHERE IdEmpleado = 3;

-- Example 3 - Query 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
    SELECT *
    FROM Empleado
    WAITFOR DELAY '00:00:15'
    SELECT *
    FROM Empleado
    ROLLBACK

-- Example 3 - Query 2
-- Compare with serializable
INSERT INTO Empleado(IdEmpleado, IdPersona, IdPuesto, IdSucursal, Salario, Fecha, IdEstado)
VALUES (25, 1, 1, 1, 600000, '2005-08-12', 1);