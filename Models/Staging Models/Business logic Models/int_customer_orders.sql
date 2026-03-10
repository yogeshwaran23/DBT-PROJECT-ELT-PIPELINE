--Customer Total Orders , product , revenue 

{{ config(materialized='table') }}

WITH total_odd AS (
    SELECT 
    c.customer_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(oi.order_item_id) AS total_items
FROM E_COMMERCE_ANALYTICS_DATA.DATA.CUSTOMER c
JOIN E_COMMERCE_ANALYTICS_DATA.DATA.ORDERS o
    ON c.customer_id = o.customer_id
JOIN E_COMMERCE_ANALYTICS_DATA.DATA.ORDER_ITEMS oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id
)


SELECT * FROM total_odd
