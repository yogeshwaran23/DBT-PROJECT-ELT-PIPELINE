{{ config(materialized='view') }}


-- RENAMING , CAST DATA TYPES AND STANDARDIZING STRINGS using macro's

WITH order_stag AS (

    SELECT 
        order_id,
        customer_id,
        CAST(order_date AS VARCHAR(40)) AS order_date,
        {{ string_stand_macro('order_status') }} AS order_status
    FROM E_COMMERCE_ANALYTICS_DATA.DATA.ORDERS

),

-- Handle NULLs AND Filter bad rows USING MACRO

order_stag2 AS (

    SELECT 
        order_id,
        customer_id,
        {{ handle_nulls_macros('order_date', "unknown") }} AS order_date,
        {{ handle_nulls_macros('order_status', "unknown") }} AS order_status
    FROM order_stag

)

SELECT * 
FROM order_stag2
