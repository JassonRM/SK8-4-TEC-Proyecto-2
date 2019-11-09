BEGIN TRAN
    SET LOCK_TIMEOUT 5000;
    PRINT 'Update Empleado'
    BEGIN TRY
        UPDATE Empleado
        SET Salario=1500055
        WHERE IdEmpleado = 5
        PRINT 'Waiting 20 sec'
        WAITFOR DELAY '00:00:20'
        PRINT 'Commit'
        COMMIT
    END TRY
    BEGIN CATCH
        PRINT 'Error'
        PRINT ERROR_MESSAGE()
        ROLLBACK
    END CATCH