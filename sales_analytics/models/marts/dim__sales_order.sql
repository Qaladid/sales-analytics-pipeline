WITH sales_order_cte AS (
    SELECT
        SALES_ORDER_ID,
        SALES_ORDER_NUMBER,
        ORDER_DATE,
        DUE_DATE,
        SHIP_DATE,
        STATUS,
        ACCOUNT_NUMBER,
        CUSTOMER_ID,
        SALES_PERSON_ID,
        TERRITORY_ID,
        CURRENCY_RATE_ID,
        SUB_TOTAL,
        TAX_AMT,
        FREIGHT,
        TOTAL_DUE,
        ROWGUID,
        MODIFIED_DATE
    FROM
        {{ ref('stg__sales_order_header') }}
)

SELECT 
    SALES_ORDER_ID,
    SALES_ORDER_NUMBER,
    ORDER_DATE,
    DUE_DATE,
    SHIP_DATE,
    STATUS,
    ACCOUNT_NUMBER,
    CUSTOMER_ID,
    SALES_PERSON_ID,
    TERRITORY_ID,
    CURRENCY_RATE_ID,
    SUB_TOTAL,
    TAX_AMT,
    FREIGHT,
    TOTAL_DUE,
    ROWGUID,
    MODIFIED_DATE
FROM sales_order_cte
