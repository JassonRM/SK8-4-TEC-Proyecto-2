BEGIN TRAN
    PRINT 'Creating descending cursor'
    DECLARE sku_cursor2 CURSOR
        FOR SELECT *
            FROM SKU
            WHERE IdSKU < 6
            ORDER BY IdSKU DESC;

    OPEN sku_cursor2;
    FETCH FROM sku_cursor2;

    WHILE @@FETCH_STATUS = 0
        BEGIN
            PRINT 'Getting next descending item'
            UPDATE SKU
            SET IdEstado = 1;
            FETCH FROM sku_cursor2;
            WAITFOR DELAY '00:00:1';
        END;

    CLOSE sku_cursor2;
    DEALLOCATE sku_cursor2;
ROLLBACK
