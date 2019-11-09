BEGIN TRAN
    PRINT 'Updating table Empleado from session 1'
    UPDATE Empleado
    SET IdEstado = 2
    WHERE IdEmpleado = 1
    PRINT 'Session 1 waiting'
    WAITFOR DELAY '00:00:15'
    PRINT 'Updating table Cliente from session 1'
    UPDATE Cliente
    SET Descripcion = 'Mal cliente'
    WHERE IdCliente = 1
ROLLBACK
