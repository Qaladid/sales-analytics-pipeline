{{ config(
    materialized='view'
) }}

-- The query extracts the BusinessEntityAddress data with consistent column names
SELECT
    BUSINESS_ENTITY_ID,
    ADDRESS_ID,
    ADDRESS_TYPE_ID,
    ROWGUID,
    MODIFIED_DATE
FROM {{ source('staging', 'BUSINESS_ENTITY_ADDRESS') }}
WHERE BUSINESS_ENTITY_ID IS NOT NULL