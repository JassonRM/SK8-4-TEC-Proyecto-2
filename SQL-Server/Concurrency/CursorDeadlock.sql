BEGIN TRAN
    PRINT 'Creating ascending cursor'
    DECLARE sku_cursor CURSOR
        FOR SELECT *
            FROM SKU
            WHERE IdSKU < 6
            ORDER BY IdSKU ASC;

    OPEN sku_cursor;
    FETCH FROM sku_cursor;

    WHILE @@FETCH_STATUS = 0
        BEGIN
            PRINT 'Getting next ascending item'
            UPDATE SKU
            SET IdEstado = 2;
            FETCH FROM sku_cursor;
            WAITFOR DELAY '00:00:1'
        END;

    CLOSE sku_cursor;
    DEALLOCATE sku_cursor;
ROLLBACK

