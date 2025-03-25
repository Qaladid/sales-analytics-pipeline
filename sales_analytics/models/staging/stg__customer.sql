{{ config(materialized='view') }}

SELECT 
    CUSTOMER_ID,
    PERSON_ID,
    STORE_ID,
    TERRITORY_ID,
    ACCOUNT_NUMBER,
    ROWGUID,
    MODIFIED_DATE::DATE AS modified_date
FROM {{ source('staging', 'CUSTOMER') }}
WHERE STORE_ID IS NOT NULL
  AND PERSON_ID IS NOT NULL
