
WITH vw_stg__title_ratings AS (
    SELECT
        tconst                                    AS t_const,
        TRY_CONVERT(DECIMAL(18,1), averageRating) AS average_rating,
        TRY_CONVERT(INT, numVotes)                AS num_votes,
        _etl_id,
        _loaded_at
    FROM {{ source("imdb_raw", "raw__title_ratings") }}
),
final AS (
    SELECT *
    FROM vw_stg__title_ratings
)
SELECT *
FROM final