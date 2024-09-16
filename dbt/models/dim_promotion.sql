{{ config(materialized='table') }}

with t_data as (
    SELECT 
    DISTINCT `promotion-ids` as promotion_code,
    FROM `latihan-big-query-363013.dibimbing.amazon_sale_report`
)

SELECT 
{{ dbt_utils.generate_surrogate_key([
    'promotion_code'
]) }} AS promotion_id, * 
FROM t_data

-- karena bentuk dari promotion-ids adalah string di ubah maka
-- diubah ke promotion karena banyak code promotion di stringnya