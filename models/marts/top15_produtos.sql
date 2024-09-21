SELECT
    id_produto,
    nome_produto,
    SUM(total_venda) AS receita_total
FROM {{ ref('agg_farmaciabr') }}
GROUP BY id_produto, nome_produto
ORDER BY receita_total DESC
LIMIT 15