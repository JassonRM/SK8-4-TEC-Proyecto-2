CREATE PROCEDURE CargarXML(@Entrada XML) AS
BEGIN

    INSERT Camion(Placa, Marca, IdEstado)
    SELECT Resultados.ListaCamiones.value('Placa[1]', 'VARCHAR(40)') AS Placa,
           Resultados.ListaCamiones.value('Marca[1]', 'VARCHAR(40)') AS Marca,
           Resultados.ListaCamiones.value('IdEstado[1]', 'INT')      AS IdEstado

    FROM @Entrada.nodes('Resultados/ListaCamiones') Resultados(ListaCamiones)
END;


DECLARE
    @ArchivoXML XML = '<?xml version="1.0"?>
 <Resultados>
   <ListaCamiones>
     <Placa>234AMY</Placa>
     <Marca>Hyundai</Marca>
     <IdEstado>1</IdEstado>
   </ListaCamiones>
</Resultados>';
    EXEC CargarXML @ArchivoXML;