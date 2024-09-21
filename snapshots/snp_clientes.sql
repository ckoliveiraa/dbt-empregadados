{% snapshot clientes_email_snapshot %}
  {{
    config(
      target_schema = 'staging',
      unique_key = 'id_cliente',
      strategy = 'check',
      check_cols = ['email_cliente']
    )
  }}

  SELECT
    CAST(customer_id AS INT) AS id_cliente,
    CAST(unit_id AS INT) AS id_unidade,
    name AS nome_cliente,
    address AS endereco_cliente,
    phone AS telefone_cliente,
    email AS email_cliente,
    current_timestamp AS dt_processamento
  FROM {{ source('raw', 'clientes') }}
{% endsnapshot %}