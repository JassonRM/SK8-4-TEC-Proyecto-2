BEGIN TRAN
    UPDATE Cliente
    SET Descripcion = 'Pesimo cliente'
    WHERE IdCliente = 1
    WAITFOR DELAY '00:00:15'
    UPDATE Empleado
    SET IdEstado = 2
    WHERE IdEmpleado = 1
ROLLBACK
