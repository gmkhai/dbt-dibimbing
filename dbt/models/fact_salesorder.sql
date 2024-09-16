{{ config(materialized='table') }}

SELECT 
index,
`Order ID` as order_id,
Date as date,
Status as status,
{{ dbt_utils.generate_surrogate_key([
    'Fulfilment', 
    '`fulfilled-by`'
])}} AS fulfilment_id,
{{ dbt_utils.generate_surrogate_key([
    'SKU'
])}} as product_id,
{{ dbt_utils.generate_surrogate_key([
    '`promotion-ids`'
])}} AS promotion_id,
{{ dbt_utils.generate_surrogate_key([
    '`Sales Channel `',
])}} as sales_channel_id,
{{ dbt_utils.generate_surrogate_key([
    '`ship-service-level`',
    '`ship-state`',
    '`ship-city`',
    '`ship-postal-code`'
])}} AS sales_shipment_id,
Qty as quantity,
Amount as amount
 FROM `latihan-big-query-363013.dibimbing.amazon_sale_report` 