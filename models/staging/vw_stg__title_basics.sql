
WITH vw_stg__title_basics AS (
    SELECT
        tconst                                AS t_const,
        NULLIF(titleType, '\N')               AS title_type,
        NULLIF(primaryTitle, '\N')            AS primary_title,
        NULLIF(originalTitle, '\N')           AS original_title,
        TRY_CONVERT(BIT,isAdult)              AS is_adult,
        TRY_CONVERT(SMALLINT, startYear)      AS start_year,
        TRY_CONVERT(SMALLINT, endYear)        AS end_year,
        TRY_CONVERT(SMALLINT, runtimeMinutes) AS runtime_minutes,
        NULLIF(genres, '\N')                  AS genres,
        _etl_id,
        _loaded_at
    FROM {{ source("imdb_raw", "raw__title_basics") }}
),
final AS (
    SELECT *
    FROM vw_stg__title_basics
)
SELECT *
FROM final