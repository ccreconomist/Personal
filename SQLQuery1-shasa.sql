SELECT NUM_CUENTA, FECHA_CONSUMO, TIPO_TRANSACCION, IMP_DESTINO, RFC_COMERCIO,LEFT(NUM_CUENTA, 6) AS NO_DE_CUENTA
FROM PROSA_510
WHERE 
FECHA_CONSUMO = '2023-09-25 00:00:00.000' AND 
TIPO_TRANSACCION = '01' AND
RFC_COMERCIO = 'SSH 9608016NA' AND
LEFT(NUM_CUENTA, 6) IN ('506372', '481281');
--IMP_DESTINO > 2000;
