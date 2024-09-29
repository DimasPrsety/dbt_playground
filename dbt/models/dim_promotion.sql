{{ config(materialized='table') }}


with t_data as (
    SELECT DISTINCT 
        `promotion-ids` as promotion_ids
    FROM `vivid-vent-437112-h9.dibimbing.amazon_sale_report`
)

SELECT 
{{ dbt_utils.generate_surrogate_key([
                'promotion_ids'
            ])}} as promotion_id
            , *
FROM t_data