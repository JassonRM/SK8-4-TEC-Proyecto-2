-- Examples 1 & 2 - Query 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
    PRINT 'Reading first time'
    SELECT *
    FROM Empleado
    WHERE IdEmpleado in(1,4)
    PRINT 'Waiting'
    WAITFOR DELAY '00:00:15'
    PRINT 'Reading second time'
    SELECT *
    FROM Empleado
    WHERE IdEmpleado in(1,4)
    ROLLBACK

-- Example 3 - Query 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
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

