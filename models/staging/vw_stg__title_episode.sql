
WITH vw_stg__title_episode AS (
    SELECT
        tconst                          AS t_const,
        NULLIF(parentTconst, '\N')      AS parent_t_const,
        TRY_CONVERT(INT, seasonNumber)  AS season_number,
        TRY_CONVERT(INT, episodeNumber) AS episode_number,
        _etl_id,
        _loaded_at
    FROM {{ source("imdb_raw", "raw__title_episode") }}
),
final AS (
    SELECT *
    FROM vw_stg__title_episode
)
SELECT *
FROM final