{{ config(
    materialized='view'
) }}

-- The query extracts the product data with consistent column names and NULL handling
SELECT
    PRODUCT_ID,
    NAME,
    PRODUCT_NUMBER,
    MAKE_FLAG,
    FINISHED_GOODS_FLAG,
    COALESCE(COLOR, '') AS COLOR,  -- Replacing NULL with an empty string for COLOR
    SAFETY_STOCK_LEVEL,
    REORDER_POINT,
    STANDARD_COST,
    LIST_PRICE,
    COALESCE(SIZE, '') AS SIZE,  -- Replacing NULL with an empty string for SIZE
    COALESCE(SIZE_UNIT_MEASURE_CODE, '') AS SIZE_UNIT_MEASURE_CODE,  -- Replacing NULL with an empty string
    COALESCE(WEIGHT_UNIT_MEASURE_CODE, '') AS WEIGHT_UNIT_MEASURE_CODE,  -- Replacing NULL with an empty string
    COALESCE(WEIGHT, 0) AS WEIGHT,  -- Replacing NULL with 0 for WEIGHT
    DAYS_TO_MANUFACTURE,
    COALESCE(PRODUCT_LINE, '') AS PRODUCT_LINE,  -- Replacing NULL with an empty string for PRODUCT_LINE
    COALESCE(CLASS, '') AS CLASS,  -- Replacing NULL with an empty string for CLASS
    COALESCE(STYLE, '') AS STYLE,  -- Replacing NULL with an empty string for STYLE
    PRODUCT_SUBCATEGORY_ID,
    PRODUCT_MODEL_ID,
    SELL_START_DATE,
    COALESCE(SELL_END_DATE, CURRENT_DATE) AS SELL_END_DATE,  -- Replacing NULL with current date for SELL_END_DATE
    ROWGUID,
    MODIFIED_DATE
FROM {{ source('staging', 'PRODUCT') }}  -- Reference the source table
WHERE PRODUCT_ID IS NOT NULL