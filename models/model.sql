select 
  cast(regexp_extract("Average Price", '\d+') AS Integer) as avg_price_for_two,
  regexp_extract("Rating", '\d+') AS interim_rating, 
  CASE WHEN interim_rating != '' THEN  CAST(interim_rating AS Integer) ELSE NULL END as Rating, 
  * exclude("Average Price", "Rating") from swiggy_file 
where
  "Location" != 'Lalitpur'