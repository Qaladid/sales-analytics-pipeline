{{ config(
    materialized='view'
) }}

-- The query extracts the address data with consistent column names
SELECT
    ADDRESS_ID,
    ADDRESS_LINE1,
    CITY,
    STATE_PROVINCE_ID,
    POSTAL_CODE,
    ROWGUID,
    MODIFIED_DATE
FROM {{ source('staging', 'ADDRESS') }} 
WHERE ADDRESS_ID IS NOT NULL