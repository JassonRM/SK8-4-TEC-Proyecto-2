-- Query 1
BEGIN TRAN
    PRINT 'Update Empleado'
    UPDATE Empleado
    SET Salario=1500000
    WHERE IdEmpleado = 2
    PRINT 'Waiting 15 sec'
    WAITFOR DELAY '00:00:15'
    PRINT 'Rollback'
ROLLBACK

