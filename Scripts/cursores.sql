-- Creacion Cursor global en proceso almacenado
CREATE PROCEDURE CursorGlobal AS
BEGIN TRY
    BEGIN TRANSACTION;
    DECLARE CursorG CURSOR GLOBAL
        FOR
        SELECT Salario FROM Empleado
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
END CATCH;


-- Creacion Cursor local en proceso almacenado
CREATE PROCEDURE CursorLocal AS
BEGIN TRY
    BEGIN TRANSACTION;
    DECLARE CursorG CURSOR LOCAL
        FOR
        SELECT Salario FROM Empleado
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
END CATCH;

-- Uso del cursor local fuera de su alcance
EXEC CursorLocal;
OPEN CursorL
    FETCH NEXT FROM CursorL
    WHILE @@FETCH_STATUS = 0
        BEGIN
            FETCH NEXT FROM CursorL
        END
    CLOSE CursorL
    DEALLOCATE CursorL

-- Uso del cursor global fuera
EXEC CursorGlobal;
OPEN CursorG
    FETCH NEXT FROM CursorG
    WHILE @@FETCH_STATUS = 0
        BEGIN
            FETCH NEXT FROM CursorG
        END
    CLOSE CursorG
    DEALLOCATE CursorG


-- DROP PROCEDURE CursorGlobal
-- DROP PROCEDURE CursorLocal