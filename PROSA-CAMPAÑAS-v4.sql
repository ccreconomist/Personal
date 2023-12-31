SELECT
    NUM_CUENTA,
    FECHA_CONSUMO,
    TIPO_TRANSACCION,
    IMP_DESTINO,
    LEFT(NUM_CUENTA, 6) AS NO_DE_CUENTA,
    '000' + SUBSTRING(NUM_CUENTA, 1, LEN(NUM_CUENTA) - 3) + '000' AS CUENTA2
FROM PROSA_510
WHERE
    FECHA_CONSUMO >= '2023-03-18 00:00:00.000'
    AND FECHA_CONSUMO <= '2023-04-18 00:00:00.000'
    AND TIPO_TRANSACCION = '01'
    AND IMP_DESTINO >= 1500 AND
	-----AND IMP_DESTINO <= 5000 AND
    RFC_COMERCIO = 'SSH 9608016NA'
	AND LEFT(NUM_CUENTA, 6) IN ('506372', '481281');