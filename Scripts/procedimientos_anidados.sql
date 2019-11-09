CREATE PROCEDURE ActualizarCliente(@IdCliente INT, @Puntos INT, @Descripcion VARCHAR(100), @IdPersona INT,
                                   @Telefono VARCHAR(40), @IdDireccion INT, @IdDistrito INT, @Detalle VARCHAR(100)) AS
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Cliente SET Puntos = @Puntos WHERE IdCliente = @IdCliente;-- OR 1 / 0 = 1;
    EXEC ActualizarPersona @IdPersona, @Telefono, @IdDireccion, @IdDistrito, @Detalle;
    UPDATE Cliente SET Descripcion = @Descripcion WHERE IdCliente = @IdCliente;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
END CATCH;


CREATE PROCEDURE ActualizarPersona(@IdPersona INT, @Telefono VARCHAR(40), @Correo VARCHAR(100), @IdDireccion INT,
                                   @IdDistrito INT,
                                   @Detalle VARCHAR(100)) AS
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Persona SET Telefono = @Telefono WHERE IdPersona = @IdPersona OR 1 / 0 = 1;
    EXEC ActualizarDireccion @IdDireccion, @IdDistrito, @Detalle;
    UPDATE Persona SET Correo = @Correo WHERE IdPersona = @IdPersona;
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH

END CATCH;


CREATE PROCEDURE ActualizarDireccion(@IdDireccion INT, @IdDistrito INT, @Detalle VARCHAR(100)) AS
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Direccion SET IdDistrito = @IdDistrito WHERE IdDireccion = @IdDireccion;
    UPDATE Direccion SET Detalle1 = @Detalle WHERE IdDireccion = @IdDireccion;
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH

END CATCH;


-- EXEC ActualizarCliente 1, 100, 'Buen Cliente', 1, '121-776-223', 1, 1, '300 mts sur del TEC'
-- DROP PROCEDURE ActualizarDireccion;
-- DROP PROCEDURE ActualizarPersona;
-- DROP PROCEDURE ActualizarCliente;