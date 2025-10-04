WITH tb_daily AS (

    SELECT 
        DISTINCT
            date(substr(DtCriacao,0,11)) AS DtDia,
            idCliente
    FROM
        transacoes
    ORDER BY
        Dtdia

),

tb_distinct_day AS (

    SELECT 
        DISTINCT
            DtDia AS DtRef
    FROM 
        tb_daily

)

SELECT 
    t1.DtRef AS DtMau,
    count(DISTINCT t2.idCliente) AS MAU

FROM
    tb_distinct_day AS t1

LEFT JOIN 
    tb_daily AS t2
ON 
    t2.DtDia <= t1.DtRef
AND 
    julianday(t1.DtRef) - julianday(t2.DtDia) < 28

GROUP BY
    DtMau

ORDER BY 
    DtMau 