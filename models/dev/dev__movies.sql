{{ 
    config({
      "as_columnstore": false,
	  "pre-hook": "{{ drop_all_indexes_on_table() }}",
	  "post-hook": "{{ create_nonclustered_index(columns = ['t_const']) }}"
    }) 
}}

WITH movies AS (
    SELECT
        t_const,
        primary_title AS title,
        REPLACE(REPLACE(title_type, 'movie', 'Movie'), 'tvMovie', 'TV Movie') AS title_type,
        start_year AS release_year,
        runtime_minutes,
        genres,
        _etl_id,
        _loaded_at
    FROM {{ source("imdb_staging", "vw_stg__title_basics") }}
    WHERE title_type IN ('tvMovie', 'movie')
)
SELECT *
FROM movies