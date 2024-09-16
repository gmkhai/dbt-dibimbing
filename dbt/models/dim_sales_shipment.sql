{{ config(materialized='table') }}


WITH t_data AS (
    SELECT 
    DISTINCT `ship-service-level` as ship_service_level,
    `ship-country` as ship_country,
    `ship-state` as ship_state,
    `ship-city` as ship_city,
    `ship-postal-code` as ship_postal_code
    FROM `latihan-big-query-363013.dibimbing.amazon_sale_report`
)


SELECT 
{{ dbt_utils.generate_surrogate_key([
    'ship_service_level',
    'ship_state',
    'ship_city',
    'ship_postal_code'
]) }} AS sales_shipment_id, *
FROM t_data
