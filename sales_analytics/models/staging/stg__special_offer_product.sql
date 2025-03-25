{{ config(materialized='view') }}

SELECT 
    SPECIAL_OFFER_ID,
    PRODUCT_ID,
    ROWGUID,
    MODIFIED_DATE::DATE AS modified_date,
FROM {{ source('staging', 'SPECIAL_OFFER_PRODUCT') }}

