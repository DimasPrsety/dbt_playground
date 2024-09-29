{{ config(materialized='table') }}


SELECT  
  dss.ship_service_level
  , count(fs.order_id) as total_orders
  , format('%.2f', sum(fs.Amount)) as total_sales
  , dss.ship_country
FROM `dibimbing.fact_salesorder` fs
JOIN `dibimbing.dim_sales_shipment` dss on fs.shipment_id = dss.shipment_id
group by 1, 4
order by 3 desc

-- Analysis of ship service performance in each country