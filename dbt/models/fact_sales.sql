{{ config(materialized='table') }}

SELECT index, 
  `Order ID` AS order_id, 
  Date AS date,
  Status AS status,
  {{ dbt_utils.generate_surrogate_key([
				'SKU'
			]) }} as product_id,
  {{ dbt_utils.generate_surrogate_key([
				'Fulfilment', 
				'`fulfilled-by`'
			])}} AS fulfilment_id,
  qty,
  amount,
FROM `latihan-big-query-363013.dibimbing.amazon_sale_report`