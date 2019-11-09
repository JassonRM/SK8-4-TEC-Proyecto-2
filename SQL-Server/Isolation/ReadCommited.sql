-- Query 1
BEGIN TRAN
    PRINT 'Update Empleado'
    UPDATE Empleado
    SET Salario=1500002
    WHERE IdEmpleado = 5
    PRINT 'Waiting 15 sec'
    WAITFOR DELAY '00:00:15'
    PRINT 'Commit'
COMMIT

