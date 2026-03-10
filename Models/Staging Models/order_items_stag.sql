
{{ config(materialized='view') }}

-- removing duplicate records

WITH remove_duplicate AS (

    SELECT  
        order_item_id,
        order_id,
        product_id,
        quantity,
        price
    FROM E_COMMERCE_ANALYTICS_DATA.DATA.ORDER_ITEMS
    QUALIFY ROW_NUMBER() OVER (PARTITION BY order_item_id ORDER BY order_item_id) = 1

),

-- RENAMING , CAST DATA TYPES AND STANDARDIZING STRINGS using macro's

order_items_stag AS (

    SELECT 
        order_item_id,
        order_id,
        product_id,
        CAST(QUANTITY AS NUMBER) AS QUANTITY,
        price
    FROM remove_duplicate

),

-- Handle NULLs AND Filter bad rows USING MACRO

order_items_stag2 AS (

    SELECT 
        order_item_id,
        order_id,
        product_id,
        {{ handle_nulls_macros('quantity', 0) }} AS quantity,
        {{ handle_nulls_macros('price', 0) }} AS price
    FROM order_items_stag

)

SELECT * 
FROM order_items_stag2
