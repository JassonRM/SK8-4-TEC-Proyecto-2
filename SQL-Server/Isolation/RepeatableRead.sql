-- Examples 1 & 2 - Query 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
    SELECT *
    FROM Empleado
    WHERE IdEmpleado in(1,4)
    WAITFOR DELAY '00:00:15'
    SELECT *
    FROM Empleado
    WHERE IdEmpleado in(1,4)
    ROLLBACK

-- Example 3 - Query 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
    SELECT *
    FROM Empleado
    WAITFOR DELAY '00:00:15'
    SELECT *
    FROM Empleado
    ROLLBACK
