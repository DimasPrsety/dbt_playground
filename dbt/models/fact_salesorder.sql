{{ config(materialized='table') }}

SELECT 
    index
    , `Order ID` AS order_id
    , Date AS date
    , Status AS status
    , {{ dbt_utils.generate_surrogate_key([
                'SKU'
            ])}} as product_id
    , {{ dbt_utils.generate_surrogate_key([
                'Fulfilment'
                , '`fulfilled-by`'
            ])}} AS fulfilment_id
    , {{ dbt_utils.generate_surrogate_key([
                '`Sales Channel `'
            ])}} AS sales_channel_id
    , {{ dbt_utils.generate_surrogate_key([
                '`ship-service-level`'
                , '`Courier Status`'
                , '`ship-city`'
                , '`ship-state`'
                , '`ship-postal-code`'
                , '`ship-country`'
            ])}} AS shipment_id
    , {{ dbt_utils.generate_surrogate_key([
                '`promotion-ids`'
            ])}} AS promotion_ids
    , Qty
    , Amount
FROM `vivid-vent-437112-h9.dibimbing.amazon_sale_report`

