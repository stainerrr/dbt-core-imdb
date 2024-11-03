{{ 
    config({
      "as_columnstore": false,
	  "pre-hook": "{{ drop_all_indexes_on_table() }}",
	  "post-hook": [
        "{{ create_nonclustered_index(columns = ['t_const']) }}"
      ] 
    }) 
}}

WITH ratings AS (
    SELECT *
    FROM {{ source("imdb_staging", "vw_stg__title_ratings") }}
)
SELECT *
FROM ratings