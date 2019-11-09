BEGIN TRAN
    PRINT 'Updating table Cliente from session 2'
    UPDATE Cliente
    SET Descripcion = 'Pesimo cliente'
    WHERE IdCliente = 1
    PRINT 'Session 2 waiting'
    WAITFOR DELAY '00:00:15'
    PRINT 'Updating table Empleado from session 2'
    UPDATE Empleado
    SET IdEstado = 2
    WHERE IdEmpleado = 1
ROLLBACK
