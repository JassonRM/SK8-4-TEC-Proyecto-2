-- Query 1
BEGIN TRAN
    UPDATE Empleado
    SET Salario=1500000
    WHERE IdEmpleado = 2
    WAITFOR DELAY '00:00:15'
ROLLBACK

