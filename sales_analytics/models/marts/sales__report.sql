-- models/marts/dim_customer.sql

WITH customer_data AS (
    SELECT 
        CUSTOMER_ID,
        PERSON_ID,
        STORE_ID,
        TERRITORY_ID,
        ACCOUNT_NUMBER,
        ROWGUID,
        MODIFIED_DATE
    FROM 
        {{ ref('stg__customer') }}
)

SELECT 
    CUSTOMER_ID,
    PERSON_ID,
    STORE_ID,
    TERRITORY_ID,
    ACCOUNT_NUMBER,
    ROWGUID,
    MODIFIED_DATE
FROM 
    customer_data;

