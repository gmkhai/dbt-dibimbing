-- Tampilkan 2 Kategori product tertinggi yang paling banyak dicari 
-- disetiap provinsi berdasarkan jumlah total quantity order nya lebih dari 200 product

WITH data_filter AS (
  SELECT  
  SUM(fs.quantity) as total_quantity,
  dss.ship_city,
  dp.category,
  rank() over(partition by dss.ship_city order by SUM(fs.quantity) DESC) AS ranking_category
  FROM `dibimbing.fact_salesorder` AS fs
  LEFT JOIN `dibimbing.dim_sales_shipment` AS dss
  ON  fs.sales_shipment_id=dss.sales_shipment_id
  LEFT JOIN `dibimbing.dim_product` AS dp
  ON fs.product_id = dp.product_id
  WHERE fs.quantity IS NOT NULL OR fs.quantity > 0
  GROUP BY dss.ship_city, dp.category
)

SELECT *
FROM data_filter
WHERE ranking_category BETWEEN 1 AND 2 AND ship_city IS NOT NULL AND total_quantity >= 200
ORDER BY total_quantity DESC,ship_city;