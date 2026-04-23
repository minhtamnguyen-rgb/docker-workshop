select *
from public."green_tripdata_2025-11."
where 
	lpep_pickup_datetime between '2025-11-01' and '2025-12-01' 
	and trip_distance <= 1;

ALTER TABLE "green_tripdata_2025-11." RENAME TO green_tripdata_2025_11;

ALTER TABLE "taxi_zone_lookup.csv" RENAME TO taxi_zone_lookup;

SELECT * FROM public.zone LIMIT 5;

SELECT
    SUM(green_tripdata_2025_11.total_amount) AS total_amount,
    public.zone."Zone" AS pickup_loc
FROM green_tripdata_2025_11 
JOIN public.zone 
    ON green_tripdata_2025_11."PULocationID"= zone."LocationID"
GROUP BY pickup_loc
order by total_amount desc;

select lpep_pickup_datetime, trip_distance
from green_tripdata_2025_11
where trip_distance < 100
order by trip_distance desc

SELECT 
    t.tip_amount,
    zpu."Zone" AS pickup_loc,
    zdo."Zone" AS dropoff_loc
FROM green_tripdata_2025_11 t
JOIN public.zone zpu
    ON t."PULocationID" = zpu."LocationID"
JOIN public.zone zdo
    ON t."DOLocationID" = zdo."LocationID"
where 
	zpu."Zone" = 'East Harlem North'
order by t.tip_amount desc
