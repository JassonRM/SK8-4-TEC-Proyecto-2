-- Query 1
BEGIN TRAN
    UPDATE Empleado
    SET Salario=1500000
    WHERE IdEmpleado = 5
    WAITFOR DELAY '00:00:15'
COMMIT

-- Query 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SELECT Salario
FROM Empleado
WHERE IdEmpleado = 5;