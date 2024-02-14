CREATE OR REPLACE EXTERNAL TABLE aisling-de-zoomcamp-2024.ny_taxi.external_green_taxi_2022
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://de-zoomcap-bucket/nyc_taxi_data/green_tripdata_2022-*.parquet']
);

SELECT * FROM aisling-de-zoomcamp-2024.ny_taxi.external_green_taxi_2022;

CREATE OR REPLACE TABLE aisling-de-zoomcamp-2024.ny_taxi.green_taxi_partitioned
PARTITION BY 
  DATE(lpep_pickup_datetime) AS
SELECT * FROM aisling-de-zoomcamp-2024.ny_taxi.external_green_taxi_2022;

CREATE OR REPLACE TABLE aisling-de-zoomcamp-2024.ny_taxi.green_taxi
AS
SELECT * FROM aisling-de-zoomcamp-2024.ny_taxi.external_green_taxi_2022;


CREATE OR REPLACE TABLE aisling-de-zoomcamp-2024.ny_taxi.green_taxi_part_clust
PARTITION BY 
DATE(lpep_pickup_datetime)
CLUSTER BY PULocationID AS
SELECT * FROM aisling-de-zoomcamp-2024.ny_taxi.external_green_taxi_2022;

SELECT DISTINCT PULocationID FROM aisling-de-zoomcamp-2024.ny_taxi.green_taxi_part_clust
WHERE lpep_pickup_datetime >= '2022-06-01' and lpep_pickup_datetime >= '2022-06-30'; 

SELECT DISTINCT PULocationID FROM aisling-de-zoomcamp-2024.ny_taxi.green_taxi
WHERE lpep_pickup_datetime >= '2022-06-01' and lpep_pickup_datetime >= '2022-06-30'; 
