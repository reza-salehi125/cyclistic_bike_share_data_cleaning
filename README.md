# Cyclistic Bike Share Dataset
## Dataset Source
The dataset, originally composed of 13 CSV files representing Cyclistic’s historical trip data from October 2024 to October 2025, was downloaded from [https://divvy-tripdata.s3.amazonaws.com/index.html](https://divvy-tripdata.s3.amazonaws.com/index.html). This is a public data source provided by Motivated International Inc., and can be used to explore how different customer types use Cyclistic bikes. The original CSV files, which ranged in size from approximately 140,000 to 790,000 rows. Some of the CSV files are too large for GitHub. Therefore, you can download them from [Google Drive](https://drive.google.com/drive/folders/12SeFlSTpcrQMz2PPLxHzYX4yIKRvgAWH?usp=drive_link)

---

## Data Appending
Data from October 2024 to October 2025 were appended vertically using SQL queries in Google BigQuery, producing a table covering the full study period.

## Data Cleaning and Transformation
The appended table underwent the following preprocessing: standardization of date and timestamp formats, removal of duplicate records and null values, cleaning of extra spaces (string-formatted fields), and type casting for numeric fields.

## Final Dataset Structure (Cleaned and Analysis-ready)
The final dataset provided here is a single CSV file containing approximately 6,026,000 rows and includes the following columns: ride_id, bike_type, ride_duration_minutes, user_type, ride_date, ride_month, ride_day_of_week, ride_hour_of_day. This dataset is cleaned and analysis-ready and can be used for tasks such as visualization, exploratory data analysis, or studying ride patterns by customer type. 

## Visualization
The dataset was used to create an interactive Tableau Public Story (including two dashboards), which illustrates trends and patterns in Cyclistic bike rides. View the Tableau Story [here](https://public.tableau.com/shared/4XW2SHT7T?:display_count=n&:origin=viz_share_link). Note: Some column names in this dataset may differ from those shown in the Tableau dashboards/story. For example, the CSV column “ride_length” is labeled as “Ride Duration” in Tableau, or the CSV column “rideable_type” is labeled as “Bike Type” in Tableau. These changes were made to improve readability and visualization in Tableau.

In addition, a notebook (in R Language) was created in Kaggle. View the Kaggle Notebook [here](https://www.kaggle.com/code/salehireza2083/cyclistic-rides-patterns-visualizations)

