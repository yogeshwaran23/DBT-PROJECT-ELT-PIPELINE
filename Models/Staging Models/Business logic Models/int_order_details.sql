{{ config(materialized='table') }}
 
-- Order Revenue Calculation
WITH int_order_details AS (
    SELECT 
        o.ORDER_ID,
        o.CUSTOMER_ID,
        o.ORDER_DATE,
        oi.ORDER_ITEM_ID,
        oi.PRODUCT_ID,
        oi.QUANTITY,
        oi.PRICE,
        (oi.QUANTITY * oi.PRICE) AS revenue
    FROM {{ ref('orders_stangin') }} o
    JOIN {{ ref('order_items_stag') }} oi
        ON o.ORDER_ID = oi.ORDER_ID
    WHERE oi.QUANTITY != 'quantity' 
)

SELECT * FROM int_order_details
