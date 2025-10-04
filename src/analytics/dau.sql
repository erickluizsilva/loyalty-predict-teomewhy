
SELECT 
    substr(DtCriacao,0,11) AS DtDia,
    COUNT(DISTINCT idCliente) AS DAU

FROM
    transacoes

GROUP BY
    DtDia