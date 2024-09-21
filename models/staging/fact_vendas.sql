WITH source AS (
    SELECT *
    FROM {{ source('raw', 'vendas') }}
),
renamed AS (
    SELECT
        CAST(purchase_id AS INT) AS id_venda,
        CAST(customer_id AS INT) AS id_cliente,
        CAST(vendor_id AS INT) AS id_vendedor,
        CAST(unit_id AS INT) AS id_unidade,
        CAST(product_id AS INT) AS id_produto,
        CAST("date" AS DATE) AS data_venda,
        CAST(quantity AS INT) AS quantidade,
        discount AS cupom_desconto,
        store_type AS tipo_loja,
        payment_method as tipo_pagamento,
        current_timestamp AS dt_processamento
    FROM source
)

SELECT *
FROM renamed
