-- Modifica cliente y ejecuta actualizar persona
CREATE PROCEDURE ActualizarCliente(@IdCliente INT, @Puntos INT, @Descripcion VARCHAR(100), @IdPersona INT,
                                   @Telefono VARCHAR(40), @Correo VARCHAR(100), @IdDireccion INT, @IdDistrito INT, @Detalle VARCHAR(100)) AS
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Cliente SET Puntos = @Puntos WHERE IdCliente = @IdCliente;-- OR 1 / 0 = 1;
    EXEC ActualizarPersona @IdPersona, @Telefono, @Correo, @IdDireccion, @IdDistrito, @Detalle;
    UPDATE Cliente SET Descripcion = @Descripcion WHERE IdCliente = @IdCliente;

    COMMIT TRANSACTION;
    RETURN;
END TRY
BEGIN CATCH
    PRINT 'ERROR: ROLLBACK Actualizar Cliente'
    PRINT ERROR_MESSAGE()
    ROLLBACK TRANSACTION;
END CATCH;

-- Modifica Persona y ejecuta actualizar Direccion
CREATE PROCEDURE ActualizarPersona(@IdPersona INT, @Telefono VARCHAR(40), @Correo VARCHAR(100), @IdDireccion INT,
                                   @IdDistrito INT,
                                   @Detalle VARCHAR(100)) AS
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Persona SET Telefono = @Telefono WHERE IdPersona = @IdPersona OR 1 / 0 = 1;
    EXEC ActualizarDireccion @IdDireccion, @IdDistrito, @Detalle;
    UPDATE Persona SET Correo = @Correo WHERE IdPersona = @IdPersona;
    COMMIT TRANSACTION;
    RETURN;
END TRY
BEGIN CATCH
    PRINT 'ERROR: ROLLBACK Actualizar Persona'
    PRINT ERROR_MESSAGE()
END CATCH;

-- Modifica Direccion
CREATE PROCEDURE ActualizarDireccion(@IdDireccion INT, @IdDistrito INT, @Detalle VARCHAR(100)) AS
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Direccion SET IdDistrito = @IdDistrito WHERE IdDireccion = @IdDireccion;
    UPDATE Direccion SET Detalle1 = @Detalle WHERE IdDireccion = @IdDireccion;
    COMMIT TRANSACTION;
    RETURN;
END TRY
BEGIN CATCH
    PRINT 'ERROR: ROLLBACK Actualizar Direccion'
    PRINT ERROR_MESSAGE()
END CATCH;


EXEC ActualizarCliente 1, 100, 'Buen Cliente', 1, '121-776-223', 'charlie@hotmail.com', 1, 1, '300 mts sur del TEC'
-- DROP PROCEDURE ActualizarDireccion;
-- DROP PROCEDURE ActualizarPersona;
-- DROP PROCEDURE ActualizarCliente;