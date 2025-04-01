-- models/marts/dim_product.sql

WITH product_data AS (
    SELECT 
        PRODUCT_ID,
        NAME AS PRODUCT_NAME,
        PRODUCT_NUMBER,
        MAKE_FLAG,
        FINISHED_GOODS_FLAG,
        COLOR,
        SAFETY_STOCK_LEVEL,
        REORDER_POINT,
        STANDARD_COST,
        LIST_PRICE,
        SIZE,
        SIZE_UNIT_MEASURE_CODE,
        WEIGHT_UNIT_MEASURE_CODE,
        WEIGHT,
        DAYS_TO_MANUFACTURE,
        PRODUCT_LINE,
        CLASS,
        STYLE,
        PRODUCT_SUBCATEGORY_ID,
        PRODUCT_MODEL_ID,
        SELL_START_DATE,
        SELL_END_DATE,
        ROWGUID,
        MODIFIED_DATE
    FROM 
        {{ ref('stg__product') }}
)

SELECT 
    PRODUCT_ID,
    PRODUCT_NAME,
    PRODUCT_NUMBER,
    MAKE_FLAG,
    FINISHED_GOODS_FLAG,
    COLOR,
    SAFETY_STOCK_LEVEL,
    REORDER_POINT,
    STANDARD_COST,
    LIST_PRICE,
    SIZE,
    SIZE_UNIT_MEASURE_CODE,
    WEIGHT_UNIT_MEASURE_CODE,
    WEIGHT,
    DAYS_TO_MANUFACTURE,
    PRODUCT_LINE,
    CLASS,
    STYLE,
    PRODUCT_SUBCATEGORY_ID,
    PRODUCT_MODEL_ID,
    SELL_START_DATE,
    SELL_END_DATE,
    ROWGUID,
    MODIFIED_DATE
FROM 
    product_data