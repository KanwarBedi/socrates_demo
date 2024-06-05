{{ config(
    materialized='view'
) }}

WITH base AS (
    SELECT
        id,
        name,
       address:street::string as street,
       address:pin::integer as pin
    FROM
        {{ source('my_source', 'original_table') }}
)

SELECT * FROM base;