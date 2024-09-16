{{ config(materialized='table') }}

WITH t_data AS (
    SELECT 
    DISTINCT `Sales Channel ` AS sales_channel
    FROM `latihan-big-query-363013.dibimbing.amazon_sale_report`
)


SELECT {{ dbt_utils.generate_surrogate_key([
    'sales_channel',
]) }} as sales_channel_id, *
FROM t_data