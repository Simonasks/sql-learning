-- Sample rows (sanity check)
SELECT *
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
LIMIT 10;

-- AGGREGATION & FILTERING

-- Count trips for each bike type and sort by most trips
SELECT
  bike_type,
  COUNT(trip_id) AS total_trips
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
GROUP BY bike_type
ORDER BY total_trips DESC;

-- For each subscriber type, average trip duration (2 decimals), longest to shortest
SELECT
  subscriber_type,
  ROUND(AVG(duration_minutes), 2) AS avg_trip_duration
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
GROUP BY subscriber_type
ORDER BY avg_trip_duration DESC;

-- Top 10 start stations by trip counts
SELECT
  start_station_name AS start_station,
  COUNT(trip_id) AS total_trips
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
GROUP BY start_station
ORDER BY total_trips DESC
LIMIT 10;

-- How many trips started in calendar year 2023?
SELECT
  COUNT(trip_id) AS total_trips_2023
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE start_time >= '2023-01-01' AND start_time < '2024-01-01';

-- For 2023: trips per month (1–12), sorted chronologically
SELECT
  EXTRACT(MONTH FROM start_time) AS month,
  COUNT(trip_id) AS trips
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE start_time >= '2023-01-01' AND start_time < '2024-01-01'
GROUP BY month
ORDER BY month;
