{{ config(
    materialized='view'
) }}

-- The query extracts the Person data with consistent column names
SELECT
    BUSINESS_ENTITY_ID,
    PERSON_TYPE,
    NAME_STYLE,
    COALESCE(TITLE, '') AS TITLE,
    FIRST_NAME,
    COALESCE(MIDDLE_NAME, '') AS MIDDLE_NAME,
    LAST_NAME,
    COALESCE(SUFFIX, '') AS SUFFIX,
    EMAIL_PROMOTION,
    COALESCE(ADDITIONAL_CONTACT_INFO, '') AS ADDITIONAL_CONTACT_INFO,
    DEMOGRAPHICS,
    ROWGUID,
    MODIFIED_DATE
FROM {{ source('staging', 'PERSON') }} 
WHERE BUSINESS_ENTITY_ID IS NOT NULL
