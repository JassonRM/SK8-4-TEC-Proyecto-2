-- Calculo de porcentaje
CREATE FUNCTION PerdidaBanco(@MetodoPago INT, @Costo INT) RETURNS FLOAT AS
BEGIN
    DECLARE @Porcentaje FLOAT;
    SELECT @Porcentaje = CASE
                             WHEN @MetodoPago = 1 THEN 10.0
                             WHEN @MetodoPago = 2 THEN 15.0
                             ELSE 0.0
        END;

    RETURN @Costo * @Porcentaje / 100;

END;

-- Calculo de edad
CREATE FUNCTION CalcularEdad(@FechaNacimiento DATE) RETURNS INT AS
BEGIN
    RETURN YEAR(GETDATE()) - YEAR(@FechaNacimiento);
END;

-- Busqueda sin optimizar
SELECT TOP 1 CONCAT(PC.Nombre, ' ', PC.Apellido1, ' ', PC.Apellido2) AS Ganador,
       dbo.CalcularEdad(PC.FechaNacimiento)                    AS Edad,
       P3.Nombre                                               AS Pais
FROM Cliente C
         INNER JOIN Persona PC ON C.IdPersona = PC.IdPersona
         INNER JOIN (SELECT
                     IdCliente
                     ,
                     CONVERT(INT
                         , Precio - dbo.PerdidaBanco(IdMetodoPago
                         , Precio)) AS PrecioFinal
                     FROM (
                              SELECT C.IdCliente, F.IdMetodoPago, (F.SubTotal + F.Impuestos) AS Precio
                              FROM Factura F
                                       INNER JOIN Cliente C ON F.IdCliente = C.IdCliente) SubPrecios) PG ON PG.IdCliente = C.IdCliente
         INNER JOIN Direccion D ON PC.IdDireccion = D.IdDireccion
         INNER JOIN Distrito D2 ON D.IdDistrito = D2.IdDistrito
         INNER JOIN Canton C2 ON D2.IdCanton = C2.IdCanton
         INNER JOIN Provincia P2 ON C2.IdProvincia = P2.IdProvincia
         INNER JOIN Pais P3 on P2.IdPais = P3.IdPais
		 ORDER BY PrecioFinal DESC;


-- Busqueda Optimizada
SELECT CONCAT(PC.Nombre, ' ', PC.Apellido1, ' ', PC.Apellido2) AS Ganador,
       dbo.CalcularEdad(PC.FechaNacimiento)                    AS Edad,
       P3.Nombre                                               AS Pais
FROM (SELECT
		TOP 1
		SubPrecios.*
		,
		CONVERT(INT
			, Precio - dbo.PerdidaBanco(IdMetodoPago
			, Precio)) AS PrecioFinal
		FROM (
				SELECT C.*, F.IdMetodoPago, (F.SubTotal + F.Impuestos) AS Precio
				FROM Factura F
						INNER JOIN Cliente C ON F.IdCliente = C.IdCliente) SubPrecios
		ORDER BY PrecioFinal DESC) C
         INNER JOIN Persona PC ON C.IdPersona = PC.IdPersona
         INNER JOIN Direccion D ON PC.IdDireccion = D.IdDireccion
         INNER JOIN Distrito D2 ON D.IdDistrito = D2.IdDistrito
         INNER JOIN Canton C2 ON D2.IdCanton = C2.IdCanton
         INNER JOIN Provincia P2 ON C2.IdProvincia = P2.IdProvincia
         INNER JOIN Pais P3 on P2.IdPais = P3.IdPais;