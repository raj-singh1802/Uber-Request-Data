-- Creating Table
CREATE TABLE uber_requests (
    request_id INT PRIMARY KEY,
    pickup_point VARCHAR(20),
    driver_id INT,
    status VARCHAR(30),
    request_date DATE,
    request_time TIME,
    request_hour INT,
    request_day VARCHAR(15),
    time_slot VARCHAR(15),
    trip_duration_minutes FLOAT,
    drop_date DATE,
    drop_time TIME
);


-- Count of total trips
SELECT COUNT(*) AS total_trips FROM uber_requests;

-- Trips by Status
SELECT status, COUNT(*) AS trips
FROM uber_requests
GROUP BY status
ORDER BY trips DESC;

-- Trips by Pickup Point
SELECT pickup_point, COUNT(*) AS trips
FROM uber_requests
GROUP BY pickup_point
ORDER BY trips DESC;

-- Trips by Day-Of-Week
SELECT request_day, COUNT(*) AS trips
FROM uber_requests
GROUP BY request_day
ORDER BY trips DESC;

-- Tips by Time Slot
SELECT time_slot, COUNT(*) AS trips
FROM uber_requests
GROUP BY time_slot
ORDER BY trips DESC;

-- Average Trip Duration (Completed Trips)
SELECT AVG(trip_duration_minutes) AS avg_duration
FROM uber_requests
WHERE status = 'Trip Completed';

-- Average Duration of Trip as per Pickup Point 
SELECT pickup_point, AVG(trip_duration_minutes) AS avg_duration
FROM uber_requests
WHERE status = 'Trip Completed'
GROUP BY pickup_point;

-- Peak Request Hour
SELECT request_hour, COUNT(*) AS trips
FROM uber_requests
GROUP BY request_hour
ORDER BY trips DESC
LIMIT 1;

-- Most Popular Pickup Point
SELECT pickup_point, COUNT(*) AS trips
FROM uber_requests
GROUP BY pickup_point
ORDER BY trips DESC
LIMIT 1;

-- Unfulfilled Requests (No Cars Available or Cancelled)
SELECT status, COUNT(*) AS unfulfilled
FROM uber_requests
WHERE status IN ('No Cars Available', 'Cancelled')
GROUP BY status;
