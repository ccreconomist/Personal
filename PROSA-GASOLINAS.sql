SELECT
    FECHA_CONSUMO,
    COUNT(DISTINCT NUM_CUENTA) AS NUM_CUENTAS_UNICAS,
    COUNT(IMP_DESTINO) AS TXN,
    SUM(IMP_DESTINO) AS MONTO_IMP_DESTINO_POR_DIA
FROM PROSA_510
WHERE 
    FECHA_CONSUMO >= '2022-01-01 00:00:00.000' AND 
    FECHA_CONSUMO <= '2023-10-31 00:00:00.000' AND
    TIPO_TRANSACCION = '01' AND
    MCC_GIRO_COMERCIO = '05542' AND
    LEFT(NUM_CUENTA, 6) IN ('481284', '481281', '403750', '481282', '446351', '481283')
GROUP BY FECHA_CONSUMO
ORDER BY FECHA_CONSUMO;