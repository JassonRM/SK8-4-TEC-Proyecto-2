USE Warehouse

DECLARE @SKUFactura TABLE
                    (
                        IdSKU     INT,
                        IdFactura INT
                    )

INSERT INTO @SKUFactura
SELECT S.IdSKU AS IdSKU, F.IdFactura AS IdFactura
FROM Factura F
         INNER JOIN Venta V ON F.IdFactura = V.IdFactura
         INNER JOIN Articulo A ON V.IdArticulo = A.IdArticulo
         INNER JOIN SKU S ON A.IdSKU = S.IdSKU;

SELECT SF1.IdSKU AS Source, SF2.IdSKU AS Target, COUNT()
FROM @SKUFactura SF1
         JOIN @SKUFactura SF2 ON SF1.IdSKU < SF2.IdSKU
WHERE SF1.IdFactura = SF2.IdFactura
GROUP BY SF1.IdSKU, SF2.IdSKU;
