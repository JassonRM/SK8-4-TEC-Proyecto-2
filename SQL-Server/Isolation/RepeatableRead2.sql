-- Example 1 - Query 2
UPDATE Empleado
SET Salario = 2200000
WHERE IdEmpleado = 1;

-- Example 2 - Query 2
UPDATE Empleado
SET Salario = 2200000
WHERE IdEmpleado = 3;

-- Example 3 - Query 2
-- Allows insert but not update
INSERT INTO Empleado(IdPersona, IdPuesto, IdSucursal, Salario, Fecha, IdEstado)
VALUES (3, 1, 1, 990000, '2008-08-12', 1);