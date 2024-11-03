
WITH vw_stg__title_akas AS (
    SELECT
        titleId                      AS title_id,
        CAST(ordering AS SMALLINT)   AS ordering,
        NULLIF(title, '\N')          AS title,
        NULLIF(region, '\N')         AS region,
        NULLIF(language, '\N')       AS language,
        NULLIF(types, '\N')          AS types,
        NULLIF(attributes, '\N')     AS attributes,
        CAST(isOriginalTitle AS BIT) AS is_original_title,
        _etl_id,
        _loaded_at
    FROM {{ source("imdb_raw", "raw__title_akas") }}
),
final AS (
    SELECT *
    FROM vw_stg__title_akas
)
SELECT *
FROM final