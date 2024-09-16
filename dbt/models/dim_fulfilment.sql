{{ config(materialized='table') }}

WITH t_data AS(
    SELECT DISTINCT 
    Fulfilment AS fulfilment, 
    `fulfilled-by` AS fulfilled_by
    FROM `latihan-big-query-363013.dibimbing.amazon_sale_report`
)

SELECT 
{{ dbt_utils.generate_surrogate_key([
				'fulfilment', 
				'fulfilled_by'
			])}} AS fulfilment_id, *
FROM t_data