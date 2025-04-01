WITH sales_order_cte AS (
    SELECT
        sod.SALES_ORDER_ID,
        sod.SALES_ORDER_DETAIL_ID,
        sod.PRODUCT_ID,
        sod.ORDER_QTY,
        sod.LINE_TOTAL,
        sod.UNIT_PRICE,
        sod.UNIT_PRICE_DISCOUNT,
        soh.ORDER_DATE,
        soh.CUSTOMER_ID,
        soh.SALES_ORDER_NUMBER,
        soh.STATUS,
        soh.TERRITORY_ID,
        soh.CURRENCY_RATE_ID,
        soh.SUB_TOTAL,
        soh.TAX_AMT,
        soh.FREIGHT,
        soh.TOTAL_DUE
    FROM
        {{ ref('stg__sales_order_detail') }} sod
    JOIN
        {{ ref('dim__sales_order') }} soh
    ON
        sod.SALES_ORDER_ID = soh.SALES_ORDER_ID
)

SELECT 
    SALES_ORDER_ID,
    SALES_ORDER_DETAIL_ID,
    SALES_ORDER_NUMBER,
    ORDER_DATE,
    CUSTOMER_ID,
    PRODUCT_ID,
    SUM(ORDER_QTY) AS total_quantity_sold,
    SUM(LINE_TOTAL) AS total_sales_amount,
    SUM(SUB_TOTAL) AS total_subtotal,
    SUM(TAX_AMT) AS total_tax,
    SUM(FREIGHT) AS total_freight,
    SUM(TOTAL_DUE) AS total_due,
    STATUS,
    TERRITORY_ID,
    CURRENCY_RATE_ID
FROM sales_order_cte
GROUP BY 
    SALES_ORDER_ID, 
    SALES_ORDER_DETAIL_ID,
    SALES_ORDER_NUMBER, 
    ORDER_DATE,
    CUSTOMER_ID,
    PRODUCT_ID,
    STATUS,
    TERRITORY_ID,
    CURRENCY_RATE_ID
