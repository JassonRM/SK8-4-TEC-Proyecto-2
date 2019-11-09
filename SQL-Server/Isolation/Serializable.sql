-- Example 1 - Query 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
    PRINT 'Reading first time'
    SELECT *
    FROM Empleado
    PRINT 'Waiting'
    WAITFOR DELAY '00:00:15'
    PRINT 'Reading second time'
    SELECT *
    FROM Empleado
    ROLLBACK

-- Example 2 - Query 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRAN
    PRINT 'Reading first time'
    SELECT *
    FROM Empleado
    WHERE IdEmpleado BETWEEN 1 AND 25
    PRINT 'Waiting'
    WAITFOR DELAY '00:00:15'
    PRINT 'Reading second time'
    SELECT *
    FROM Empleado
    WHERE IdEmpleado BETWEEN 1 AND 25
    ROLLBACK

