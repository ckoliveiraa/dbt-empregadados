-- tests/test_valor_compra.sql
  SELECT total_venda
  FROM {{ ref('agg_farmaciabr') }}
  WHERE total_venda <= 0

