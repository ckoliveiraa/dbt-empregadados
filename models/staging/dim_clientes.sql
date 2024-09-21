WITH clientes_atuais AS (
    SELECT *
    FROM {{ ref('clientes_email_snapshot') }}
    WHERE dbt_valid_to IS NULL
),
clientes AS (
    SELECT
        id_cliente,
        id_unidade,
        nome_cliente,
        endereco_cliente,
        telefone_cliente,
        email_cliente,
        current_timestamp AS dt_processamento
    FROM clientes_atuais
)

SELECT *
FROM clientes

