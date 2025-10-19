-- Sample rows (sanity check)
SELECT *
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
LIMIT 10;

-- FUNDAMENTALS

-- Show the 5 most recent trips in the dataset
SELECT start_time, trip_id, start_station_name, end_station_name, duration_minutes, bike_type, subscriber_type
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
ORDER BY start_time DESC
LIMIT 5;

-- Find all trips taken on electric bikes
SELECT *
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE bike_type = 'electric';

-- Return all trips where the end station is missing
SELECT *
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE end_station_name IS NULL;

-- List all subscriber types that aren't "Explorer"
SELECT DISTINCT subscriber_type
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE subscriber_type <> 'Explorer' AND subscriber_type IS NOT NULL;

-- Find trips that lasted between 10 and 30 minutes
SELECT *
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE duration_minutes BETWEEN 10 AND 30;
