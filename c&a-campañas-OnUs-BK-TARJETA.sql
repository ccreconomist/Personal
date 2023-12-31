SELECT SOCIO, FECHA, PRODUCTO, COUNT(CUENTAREAL) AS CUENTA, SUM(TXN) AS COMPRAS, SUM(MONTOREAL) FACTURADO, TRANSACCION
FROM (
    SELECT 
        SOCIO, 
        PRODUCTO,
        CUENTAREAL,
		FECHA,
        COUNT(CUENTAREAL) AS TXN, 
        SUM(MontoReal) AS MONTOREAL, 
    --    MAX(DAT_ATIVACAO_CTAF) AS DAT_ATIVACAO_CTAF, -- Displaying the maximum date for unique accounts
        TRANSACCION
    FROM (
         
			SELECT 'C&A' AS SOCIO, 
			'BK' AS PRODUCTO,
			NUM_CAR_CARF As Tarjeta,
			NUM_CTA_CTAF As Cuenta,
			DAT_ADES_CTAF AS APROBADOS,  
			DAT_TRANS_COM AS FECHA,
			--YEAR(DAT_TRANS_COM) AS ANIO, MONTH(DAT_TRANS_COM) AS MES,
			(VAL_TRANS_COM - VAL_JUROS_PARC_COM) AS MONTO,
		     CRE.VAL_DADO_ORIG_LKP As Cre_Vision, 
			 CRE.DES_PLANO_CRED_LKP As Des_Credito,  
			 TRA.VAL_DADO_ORIG_LKP As TXN_Vision, 
			 TRA.DES_TIPO_TRANS_LKP As Des_Txn,  
			 
			 Case When TXN_Vision In('320070','320080','320081','320073','320074','320083','320090','320850')Then 'REVERSA' 
					Else 'C' End As TRANSACCION,  
			Case When TXN_Vision In('320070','320080','320081','320073','320074','320083','320090','320850')Then Null 
					Else Cuenta End As CuentaReal,
			Case When TXN_Vision In ('320070','320080','320081','320073','320074','320083','320090','320850') Then (Monto * -1) 
					Else Monto End As MontoReal, 
			CASE WHEN 	Des_Credito LIKE '%C&A%' THEN 'ON' ELSE 'OF' END AS TIPOTXN
		--	CASE WHEN DAT_PRI_COM_CTAF =  DAT_TRANS_COM THEN 'P' ELSE 'R' END TIPOCOMPRA
			
			FROM COMPRA_V
			INNER JOIN CARTAO_FINANCIAMENTO_V   ON  ID_CAR_COM = ID_CAR_CARF
			INNER JOIN CONTA_FINANCIAMENTO_V   ON  ID_CTA_CTAF = ID_CTA_CARF
			INNER JOIN PLANO_CREDITO_V CRE   ON  ID_PLANO_CRED_LKP = ID_PLANO_CRED_COM
			INNER JOIN TIPO_TRANSACAO_V TRA   ON  ID_TIPO_TRANS_LKP = ID_TIPO_TRANS_COM
				AND TRA.VAL_DADO_ORIG_LKP  IN  ('320070','320080','320081','320073','320074','320083','320090','320850','320004','320010','320005','320001','320003','320002','320048','320049','320040','320047','320042','320041','320185','320182')
				AND CRE.VAL_DADO_ORIG_LKP NOT IN ('32008500')
				AND ID_PROD_CTAF IN ('9')
				AND NUM_REF_COM <> '75412913332944277870628' 
				AND DAT_TRANS_COM BETWEEN '2023-10-16' AND '2023-11-05' 
				AND TRANSACCION ='C'
				AND TIPOTXN ='ON'

    ) AS A -- End of modified nested subquery
    GROUP BY SOCIO, FECHA, PRODUCTO, CUENTAREAL, TRANSACCION
) AS A -- End of subquery
GROUP BY SOCIO, FECHA, PRODUCTO, TRANSACCION