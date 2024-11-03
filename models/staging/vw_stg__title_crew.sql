
WITH vw_stg__title_crew AS (
    SELECT
        tconst                  AS t_const,
        NULLIF(directors, '\N') AS directors,
        NULLIF(writers, '\N')   AS writers,
        _etl_id,
        _loaded_at
    FROM {{ source("imdb_raw", "raw__title_crew") }}
),
final AS (
    SELECT *
    FROM vw_stg__title_crew
)
SELECT *
FROM final