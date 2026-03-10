{{ config(materialized='view') }}


-- RENAMING, CAST DATA TYPES AND STANDARDIZING STRINGS using macros
WITH product_stag AS (
    SELECT 
        product_id,
        {{ string_stand_macro('PRODUCT_NAME') }} AS product_name,
        {{ string_stand_macro('CATEGORY') }} AS category,
        price 
    FROM E_COMMERCE_ANALYTICS_DATA.DATA.PRODUCT 
),

-- Handle NULLs AND Filter bad rows USING MACROS
product_stag2 AS (
    SELECT 
        product_id,
        {{ handle_nulls_macros('product_name', "unknown") }} AS product_name,
        {{ handle_nulls_macros('category', "unknown") }} AS category,
        {{ handle_nulls_macros('price', 0) }} AS price
    FROM product_stag
)

SELECT * FROM product_stag2
