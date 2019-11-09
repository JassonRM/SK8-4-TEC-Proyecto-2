CREATE VIEW MayoresVentas
    WITH SCHEMABINDING
AS
SELECT A.IdArticulo,
       CONCAT(PC.Nombre, ' ', PC.Apellido1, ' ', PC.Apellido2) AS Cliente,
       C.Puntos                                                AS PuntosCliente,
       A.Codigo                                                AS Articulo,
       C2.Nombre                                               AS Categoria,
       F.Subtotal + F.Impuestos                                AS Monto,
       MP.Metodo                                               AS MetodoPago
FROM dbo.Factura F
         INNER JOIN dbo.Cliente C ON C.IdCliente = F.IdCliente
         INNER JOIN dbo.Persona PC ON C.IdPersona = PC.IdPersona
         INNER JOIN dbo.Empleado E ON E.IdEmpleado = F.IdEmpleado
         INNER JOIN dbo.MetodoPago MP on F.IdMetodoPago = MP.IdMetodoPago
         INNER JOIN dbo.Venta V on F.IdFactura = V.IdFactura
         INNER JOIN dbo.Articulo A on V.IdArticulo = A.IdArticulo
         INNER JOIN dbo.SKU S on A.IdSKU = S.IdSKU
         INNER JOIN dbo.Categoria C2 on S.IdCategoria = C2.IdCategoria
WHERE F.Subtotal + F.Impuestos > 200000;

CREATE UNIQUE CLUSTERED INDEX
    IdxIdArticulo
    ON dbo.MayoresVentas (IdArticulo);

-- SELECT *
-- FROM dbo.MayoresVentas WITH (NOEXPAND)
--
-- UPDATE Cliente SET Puntos =113405 WHERE Cliente.IdCliente = 25;