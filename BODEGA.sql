SELECT
    FECHA_CONSUMO,
    COUNT(DISTINCT NUM_CUENTA) AS NUM_CUENTAS_UNICAS,
    COUNT(IMP_DESTINO) AS TXN,
    SUM(IMP_DESTINO) AS MONTO_IMP_DESTINO_POR_DIA
FROM PROSA_510
WHERE 
    FECHA_CONSUMO >= '2023-01-01 00:00:00.000' AND 
    FECHA_CONSUMO <= '2023-09-30 00:00:00.000' AND 
    TIPO_TRANSACCION = '01' AND 
    LEFT(NUM_CUENTA, 6) IN ('506371', '481283') AND --BINES DE SHASA
    RFC_COMERCIO = 'NWM 9709244W4' AND (
        CLAVE_COMERCIO LIKE '%4163436' OR
        CLAVE_COMERCIO LIKE '%4163435' OR
        CLAVE_COMERCIO LIKE '%4302584' OR
        CLAVE_COMERCIO LIKE '%8435228' OR
        CLAVE_COMERCIO LIKE '%8435228' OR
        CLAVE_COMERCIO LIKE '%4392592' OR
        CLAVE_COMERCIO LIKE '%4194989' OR
        CLAVE_COMERCIO LIKE '%4044712' OR
        CLAVE_COMERCIO LIKE '%4180118' OR
        CLAVE_COMERCIO LIKE '%8434689' OR
        CLAVE_COMERCIO LIKE '%4302592')
GROUP BY FECHA_CONSUMO;