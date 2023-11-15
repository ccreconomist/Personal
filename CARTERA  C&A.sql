SELECT 
    CUENTA,
    BLOQ_COBR,
    BLOQ_OPER,
    ACTIVACION
    --MONTH(DATEADD(YEAR, 1, ACTIVACION)) AS Mes_Cumple_Anio,
    --DATEADD(YEAR, 1, ACTIVACION) AS ANIVERSARIO
FROM IT_CARTERA_PLCC_EXT
WHERE 
    ACTIVACION IS NOT NULL AND
    APROBACION IS NOT NULL
    --WHERE DATEDIFF(YEAR, ACTIVACION, GETDATE()) = 1
        AND (ULTC > CAST( DATEADD(YEAR,-1,(DATEADD(MONTH, DATEDIFF(MONTH, '20001231', GETDATE())-1, '20001231') )) AS DATE)
        OR ULTD > CAST( DATEADD(YEAR,-1,(DATEADD(MONTH, DATEDIFF(MONTH, '20001231', GETDATE())-1, '20001231') )) AS DATE)
        OR ULTP > CAST( DATEADD(YEAR,-1,(DATEADD(MONTH, DATEDIFF(MONTH, '20001231', GETDATE())-1, '20001231') )) AS DATE)
    )
    --AND BLOQ_COBR IN ('', 'G')
    --AND BLOQ_OPER IN ('', 'Q')

UNION ALL

SELECT 
    CUENTA,
    BLOQ_COBR,
    BLOQ_OPER,
    ACTIVACION
	---,
    --MONTH(DATEADD(YEAR, 1, ACTIVACION)) AS Mes_Cumple_Anio,
    ---DATEADD(YEAR, 1, ACTIVACION) AS ANIVERSARIO
FROM IT_CARTERA_BK
WHERE 
    ACTIVACION IS NOT NULL AND
    APROBACION IS NOT NULL
    --WHERE DATEDIFF(YEAR, ACTIVACION, GETDATE()) = 1
        AND (ULTC > CAST( DATEADD(YEAR,-1,(DATEADD(MONTH, DATEDIFF(MONTH, '20001231', GETDATE())-1, '20001231') )) AS DATE)
        OR ULTD > CAST( DATEADD(YEAR,-1,(DATEADD(MONTH, DATEDIFF(MONTH, '20001231', GETDATE())-1, '20001231') )) AS DATE)
        OR ULTP > CAST( DATEADD(YEAR,-1,(DATEADD(MONTH, DATEDIFF(MONTH, '20001231', GETDATE())-1, '20001231') )) AS DATE)
    )
    --AND BLOQ_COBR IN ('', 'G')
    --AND BLOQ_OPER IN ('', 'Q')

UNION ALL

SELECT 
    CUENTA,
    BLOQ_COBR,
    BLOQ_OPER,
    ACTIVACION
	--,
    --MONTH(DATEADD(YEAR, 1, ACTIVACION)) AS Mes_Cumple_Anio,
    --DATEADD(YEAR, 1, ACTIVACION) AS ANIVERSARIO
FROM IT_CARTERA_PL
WHERE 
    ACTIVACION IS NOT NULL AND
    APROBACION IS NOT NULL
    --WHERE DATEDIFF(YEAR, ACTIVACION, GETDATE()) = 1
        AND (ULTC > CAST( DATEADD(YEAR,-1,(DATEADD(MONTH, DATEDIFF(MONTH, '20001231', GETDATE())-1, '20001231') )) AS DATE)
        OR ULTD > CAST( DATEADD(YEAR,-1,(DATEADD(MONTH, DATEDIFF(MONTH, '20001231', GETDATE())-1, '20001231') )) AS DATE)
        OR ULTP > CAST( DATEADD(YEAR,-1,(DATEADD(MONTH, DATEDIFF(MONTH, '20001231', GETDATE())-1, '20001231') )) AS DATE)
    )
    --AND BLOQ_COBR IN ('', 'G')
    ---AND BLOQ_OPER IN ('', 'Q')
ORDER BY ACTIVACION;