{{ config(materialized='view') }}


-- RENAMING , CAST DATA TYPES AND STANDARDIZING STRINGS using macro's

WITH CUST_STAGING AS (

    SELECT 
        CUSTOMER_ID,
        {{string_stand_macro('CUSTOMER_NAME')}} AS CUSTOMER_NAME,
        {{string_stand_macro('EMAIL')}} AS EMAIL,
        {{string_stand_macro('CITY')}} AS CITY,
        CAST(SIGNUP_DATE AS VARCHAR(40)) AS SIGNUP_DATE
    FROM E_COMMERCE_ANALYTICS_DATA.DATA.CUSTOMER

),

-- Handle NULLs AND Filter bad rows USING MACRO

CUST_STAGING2 AS (

    SELECT 
        CUSTOMER_ID,
        {{ handle_nulls_macros('CUSTOMER_NAME', "unknown") }} AS CUSTOMER_NAME,
        {{ handle_nulls_macros('EMAIL', "unknown") }} AS EMAIL,
        {{ handle_nulls_macros('CITY', "unknown") }} AS CITY,
        {{ handle_nulls_macros('SIGNUP_DATE', "null") }} AS SIGNUP_DATE
    FROM CUST_STAGING

)

SELECT * 
FROM CUST_STAGING2
