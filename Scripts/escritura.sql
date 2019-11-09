-- Insercion en al menos 4 tablas
CREATE PROCEDURE Escritura(@IdDistrito INT, @Detalle1 VARCHAR(100), @Detalle2 VARCHAR(100), @Identificacion VARCHAR(40),
                           @Nombre VARCHAR(40), @Apellido1 VARCHAR(40), @Apellido2 VARCHAR(40), @Telefono VARCHAR(40),
                           @Correo VARCHAR(100), @FechaNacimiento DATE,
                           @Puesto VARCHAR(40), @DescripcionPuesto VARCHAR(100), @Sucursal INT, @Salario INT) AS
BEGIN TRY
    BEGIN TRANSACTION;
--  Inserción direccion
    INSERT INTO Direccion(IdDistrito, Detalle1, Detalle2)
    VALUES (@IdDistrito, @Detalle1, @Detalle2);

--  Insercion persona
    INSERT INTO Persona(Identificacion, Nombre, Apellido1, Apellido2, Telefono, Correo, FechaNacimiento,
                        FechaRegistro,
                        IdEstado, IdDireccion)
    VALUES (@Identificacion, @Nombre, @Apellido1, @Apellido2, @Telefono, @Correo, @FechaNacimiento, GETDATE(), 1,
            SCOPE_IDENTITY());

    DECLARE @NuevaPersona INT;
    SET @NuevaPersona = SCOPE_IDENTITY();

--  Insercion Puesto
    INSERT INTO Puesto(Nombre, Descripcion)
    VALUES (@Puesto, @DescripcionPuesto);

-- Insercion Empleado
    INSERT INTO Empleado(IdPersona, IdPuesto, IdSucursal, Salario, Fecha, IdEstado)
    VALUES (@NuevaPersona, SCOPE_IDENTITY(), @Sucursal, @Salario, GETDATE(), 1);
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    PRINT 'ERROR: EXECUTE ROLLBACK'
    ROLLBACK TRANSACTION;
END CATCH;


Escritura 5, '500 mts sur del banco', 'Casa color cafe', '513-211-323', 'Roberto', 'Hidalgo', 'Murillo',
            '83276511', 'roberto.hm@gmail.com', '1998-08-24', 'Repartidor', 'Encargado de la distribución de productos',
            1, 400000;

