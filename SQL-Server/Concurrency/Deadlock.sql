BEGIN TRAN
    UPDATE Empleado
    SET IdEstado = 2
    WHERE IdEmpleado = 1
    WAITFOR DELAY '00:00:15'
    UPDATE Cliente
    SET Descripcion = 'Mal cliente'
    WHERE IdCliente = 1
ROLLBACK
