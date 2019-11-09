-- Query 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
PRINT 'Reading Empleado with Read Committed'
SELECT Salario
FROM Empleado
WHERE IdEmpleado = 5;