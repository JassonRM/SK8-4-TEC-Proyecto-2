-- Query 2
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
PRINT 'Reading Empleado with Read Uncommitted'
SELECT Salario
FROM Empleado
WHERE IdEmpleado = 2;