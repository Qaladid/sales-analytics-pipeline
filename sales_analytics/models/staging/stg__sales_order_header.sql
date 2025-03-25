{{ config(materialized='view') }}

SELECT 
    SALES_ORDER_ID,
    REVISION_NUMBER,
    ORDER_DATE::DATE AS ORDER_DATE,   -- Convert to date without time
    DUE_DATE::DATE AS DUE_DATE,       -- Convert to date without time
    SHIP_DATE::DATE AS SHIP_DATE,     -- Convert to date without time
    "STATUS",
    ONLINE_ORDER_FLAG,
    SALES_ORDER_NUMBER,
    COALESCE(PURCHASE_ORDER_NUMBER, 'N/A') AS PURCHASE_ORDER_NUMBER, -- Replace NULL with 0 (instead of 'N/A')
    ACCOUNT_NUMBER,
    CUSTOMER_ID,
    COALESCE(SALES_PERSON_ID, 0) AS SALES_PERSON_ID, -- Replace NULL with 0
    TERRITORY_ID,
    BILL_TO_ADDRESS_ID,
    SHIP_TO_ADDRESS_ID,
    SHIP_METHOD_ID,
    COALESCE(CREDIT_CARD_ID, 0) AS CREDIT_CARD_ID, -- Replace NULL with 0 (instead of 'N/A')
    COALESCE(CREDIT_CARD_APPROVAL_CODE, 'N/A') AS CREDIT_CARD_APPROVAL_CODE, -- Replace NULL with 'N/A'
    COALESCE(CURRENCY_RATE_ID, 0) AS CURRENCY_RATE_ID, -- Replace NULL with 0
    COALESCE(COMMENT, 'No Comment') AS COMMENT, -- Replace NULL with 'No Comment'
    ROWGUID,
    MODIFIED_DATE::DATE AS MODIFIED_DATE, -- Convert to date without time
    SUB_TOTAL,
    TAX_AMT,
    FREIGHT,
    TOTAL_DUE
FROM {{ source('staging', 'SALES_ORDER_HEADER') }}
WHERE SALES_ORDER_ID IS NOT NULL
  AND CUSTOMER_ID IS NOT NULL
  AND MODIFIED_DATE IS NOT NULL
