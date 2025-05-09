{{ config(materialized='view') }}

SELECT 
    SALES_ORDER_ID,
    SALES_ORDER_DETAIL_ID,
    COALESCE(CARRIER_TRACKING_NUMBER, 'N/A') AS CARRIER_TRACKING_NUMBER,
    ORDER_QTY,
    PRODUCT_ID,
    SPECIAL_OFFER_ID,
    LINE_TOTAL,
    ROWGUID,
    MODIFIED_DATE::DATE AS modified_date, 
    UNIT_PRICE,
    UNIT_PRICE_DISCOUNT
FROM {{ source('staging', 'SALES_ORDER_DETAIL') }}
WHERE ORDER_QTY IS NOT NULL
  AND PRODUCT_ID IS NOT NULL