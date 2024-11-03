
WITH vw_stg__title_principals AS (
    SELECT
        tconst AS t_const,
        TRY_CONVERT(INT, ordering) AS ordering,
        nconst                     AS n_const,
        NULLIF(category, 'N\')     AS category,
        NULLIF(job, 'N\')          AS job,
        NULLIF(characters, 'N\')   AS characters,
        _etl_id,
        _loaded_at
    FROM {{ source("imdb_raw", "raw__title_principals") }}
),
final AS (
    SELECT *
    FROM vw_stg__title_principals
)
SELECT *
FROM final