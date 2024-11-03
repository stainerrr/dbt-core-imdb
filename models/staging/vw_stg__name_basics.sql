
WITH vw_stg__name_basics AS (
    SELECT
        nconst                           AS n_const,
        NULLIF(primaryName, '\N')        AS primary_name,
        TRY_CONVERT(SMALLINT, birthYear) AS birth_year,
        TRY_CONVERT(SMALLINT, deathYear) AS death_year,
        NULLIF(primaryProfession, '\N')  AS primary_profession,
        NULLIF(knownForTitles, '\N')     AS known_for_titles,
        _etl_id,
        _loaded_at
    FROM {{ source("imdb_raw", "raw__name_basics") }}
),
final AS (
    SELECT *
    FROM vw_stg__name_basics
)
SELECT *
FROM final