{{ config(materialized='table') }}


with t_data as(
    SELECT DISTINCT
    `Sales Channel ` as sales_channel
    FROM `vivid-vent-437112-h9.dibimbing.amazon_sale_report` 
)

SELECT
    {{ dbt_utils.generate_surrogate_key([
        'sales_channel'
    ])}} as sales_channel_id
    , *
FROM t_data

