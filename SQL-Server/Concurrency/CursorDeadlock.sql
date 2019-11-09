BEGIN TRAN
    DECLARE sku_cursor CURSOR
        FOR SELECT *
            FROM SKU
            WHERE IdSKU < 5
            ORDER BY IdSKU ASC;

    OPEN sku_cursor;
    FETCH FROM sku_cursor;

    WHILE @@FETCH_STATUS = 0
        BEGIN
            UPDATE SKU
            SET IdEstado = 2;
            FETCH FROM sku_cursor;
            WAITFOR DELAY '00:00:1'
        END;

    CLOSE sku_cursor;
    DEALLOCATE sku_cursor;
ROLLBACK

