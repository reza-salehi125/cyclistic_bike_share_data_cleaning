
-- Cyclistic Bike-share Data Cleaning.
-- This script standardizes, and cleans, raw cyclistic bike-share data
-- into an analysis-ready table.

CREATE TABLE YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_bike_share_oct_2024_to_oct_2025 AS

-- Step 1: Combine cyclistic raw data from Oct. 2024 to Oct. 2025
WITH cyclistic_data_2024_2025 AS (
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2024_10
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2024_11
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2024_12
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2025_01
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2025_02
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2025_03
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2025_04
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2025_05
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2025_06
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2025_07
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2025_08
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2025_09
UNION ALL
SELECT
  *
FROM
  YOUR_PROJECT_ID.YOUR_DATASET_NAME.cyclistic_data_2025_10
),

-- Step 2: Select, clean, and standardize variables
-- Step 3: Timestamps, extract date and time components
-- Step 4: Filter out NULL
cyclistic_data_2024_2025_cleaned AS (
SELECT
  ride_id,
  rideable_type AS bike_type,
  SAFE_CAST(started_at AS TIMESTAMP) AS started_timestamp,
  SAFE_CAST(ended_at   AS TIMESTAMP) AS ended_timestamp,
  TRIM(member_casual) AS membership,
  DATE(SAFE_CAST(started_at AS TIMESTAMP)) AS ride_date,
  EXTRACT(MONTH FROM SAFE_CAST(started_at AS TIMESTAMP)) AS ride_month,
  EXTRACT(DAYOFWEEK FROM SAFE_CAST(started_at AS TIMESTAMP)) AS ride_day_of_week,
  EXTRACT(HOUR FROM SAFE_CAST(started_at AS TIMESTAMP)) AS ride_hour_of_day
FROM 
  cyclistic_data_2024_2025
WHERE
  SAFE_CAST(started_at AS TIMESTAMP)  IS NOT NULL
  AND SAFE_CAST(ended_at   AS TIMESTAMP) IS NOT NULL
)

-- Step 5: Calculate length of ride
-- Step 6: Filter out invalid data
SELECT
  ride_id,
  bike_type,
  started_timestamp,
  ended_timestamp,
  TIMESTAMP_DIFF(ended_timestamp, started_timestamp, MINUTE) AS length_of_ride,
  membership,
  ride_date,
  ride_month,
  ride_day_of_week,
  ride_hour_of_day
FROM 
  cyclistic_data_2024_2025_cleaned
WHERE
  TIMESTAMP_DIFF(ended_timestamp, started_timestamp, MINUTE) > 0
  AND TIMESTAMP_DIFF(ended_timestamp, started_timestamp, MINUTE) <= 1440


