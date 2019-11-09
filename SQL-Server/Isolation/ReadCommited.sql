-- Query 1
BEGIN TRAN
    UPDATE Empleado
    SET Salario=1500002
    WHERE IdEmpleado = 5
    WAITFOR DELAY '00:00:15'
COMMIT

