-- ============================================
-- SQL ANALYSIS QUERIES: RIDE-HAILING DATABASE
-- Author: Rupak Kumar | IIT Kanpur
-- Level: Beginner (SELECT, WHERE, JOIN, GROUP BY)
-- ============================================


-- ============================================
-- SECTION 1: BASIC SELECT QUERIES
-- ============================================

-- Q1. View all riders
SELECT * FROM riders;

-- Q2. View all active drivers
SELECT * FROM drivers
WHERE is_active = 1;

-- Q3. View all completed trips
SELECT * FROM trips
WHERE trip_status = 'Completed';

-- Q4. View all cancelled trips
SELECT * FROM trips
WHERE trip_status = 'Cancelled';

-- Q5. List trips where fare is more than ₹400
SELECT trip_id, pickup_location, drop_location, fare_amount
FROM trips
WHERE fare_amount > 400
ORDER BY fare_amount DESC;

-- Q6. List trips by distance (longest first)
SELECT trip_id, pickup_location, drop_location, distance_km
FROM trips
ORDER BY distance_km DESC;


-- ============================================
-- SECTION 2: FILTERING & CONDITIONS
-- ============================================

-- Q7. Find all Mini vehicle trips
SELECT * FROM trips
WHERE vehicle_type = 'Mini';

-- Q8. Find trips in January 2024
SELECT * FROM trips
WHERE trip_date BETWEEN '2024-01-01' AND '2024-01-31';

-- Q9. Find failed payments
SELECT * FROM payments
WHERE payment_status = 'Failed';

-- Q10. Find riders from Delhi
SELECT name, phone FROM riders
WHERE city = 'Delhi';

-- Q11. Trips with distance between 10 and 20 km
SELECT trip_id, pickup_location, drop_location, distance_km
FROM trips
WHERE distance_km BETWEEN 10 AND 20;


-- ============================================
-- SECTION 3: AGGREGATE FUNCTIONS
-- ============================================

-- Q12. Total number of trips
SELECT COUNT(*) AS total_trips FROM trips;

-- Q13. Total revenue from completed trips
SELECT SUM(fare_amount) AS total_revenue
FROM trips
WHERE trip_status = 'Completed';

-- Q14. Average fare per trip
SELECT ROUND(AVG(fare_amount), 2) AS avg_fare FROM trips;

-- Q15. Maximum and minimum fare
SELECT MAX(fare_amount) AS max_fare,
       MIN(fare_amount) AS min_fare
FROM trips;

-- Q16. Total trips per city (using riders table)
SELECT city, COUNT(*) AS total_riders
FROM riders
GROUP BY city
ORDER BY total_riders DESC;

-- Q17. Revenue by vehicle type
SELECT vehicle_type,
       COUNT(*) AS trips,
       SUM(fare_amount) AS total_revenue,
       ROUND(AVG(fare_amount), 2) AS avg_fare
FROM trips
WHERE trip_status = 'Completed'
GROUP BY vehicle_type
ORDER BY total_revenue DESC;

-- Q18. Count trips by status
SELECT trip_status, COUNT(*) AS count
FROM trips
GROUP BY trip_status;

-- Q19. Payment method usage
SELECT payment_method,
       COUNT(*) AS usage_count,
       SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY usage_count DESC;


-- ============================================
-- SECTION 4: JOINS (Most Important!)
-- ============================================

-- Q20. INNER JOIN: Rider name + their trip details
SELECT r.name AS rider_name,
       r.city,
       t.pickup_location,
       t.drop_location,
       t.fare_amount,
       t.trip_status
FROM riders r
INNER JOIN trips t ON r.rider_id = t.rider_id
ORDER BY r.name;

-- Q21. INNER JOIN: Driver name + trips they completed
SELECT d.name AS driver_name,
       d.vehicle_type,
       t.pickup_location,
       t.drop_location,
       t.fare_amount,
       t.trip_date
FROM drivers d
INNER JOIN trips t ON d.driver_id = t.driver_id
WHERE t.trip_status = 'Completed'
ORDER BY t.fare_amount DESC;

-- Q22. 3-Table JOIN: Rider + Trip + Payment
SELECT r.name AS rider_name,
       t.pickup_location,
       t.drop_location,
       t.fare_amount,
       p.payment_method,
       p.payment_status
FROM riders r
INNER JOIN trips t ON r.rider_id = t.rider_id
INNER JOIN payments p ON t.trip_id = p.trip_id;

-- Q23. LEFT JOIN: All drivers and their trips (including drivers with 0 trips)
SELECT d.name AS driver_name,
       d.vehicle_type,
       COUNT(t.trip_id) AS total_trips_done
FROM drivers d
LEFT JOIN trips t ON d.driver_id = t.driver_id
GROUP BY d.driver_id, d.name, d.vehicle_type
ORDER BY total_trips_done DESC;

-- Q24. JOIN with Ratings: Best rated trips
SELECT r.name AS rider_name,
       d.name AS driver_name,
       t.pickup_location,
       t.drop_location,
       rt.driver_rating,
       rt.feedback
FROM ratings rt
INNER JOIN trips t  ON rt.trip_id  = t.trip_id
INNER JOIN riders r ON t.rider_id  = r.rider_id
INNER JOIN drivers d ON t.driver_id = d.driver_id
WHERE rt.driver_rating >= 4.5
ORDER BY rt.driver_rating DESC;


-- ============================================
-- SECTION 5: BUSINESS INSIGHTS
-- ============================================

-- Q25. Top 5 riders by total rides
SELECT name, city, total_rides
FROM riders
ORDER BY total_rides DESC
LIMIT 5;

-- Q26. Top 5 drivers by total trips
SELECT name, vehicle_type, city, total_trips
FROM drivers
ORDER BY total_trips DESC
LIMIT 5;

-- Q27. Average driver rating per driver
SELECT d.name AS driver_name,
       ROUND(AVG(rt.driver_rating), 2) AS avg_rating,
       COUNT(rt.rating_id) AS rated_trips
FROM drivers d
INNER JOIN trips t  ON d.driver_id  = t.driver_id
INNER JOIN ratings rt ON t.trip_id = rt.trip_id
GROUP BY d.driver_id, d.name
ORDER BY avg_rating DESC;

-- Q28. Monthly revenue summary
SELECT 
    CASE 
        WHEN trip_date BETWEEN '2024-01-01' AND '2024-01-31' THEN 'January 2024'
        WHEN trip_date BETWEEN '2024-02-01' AND '2024-02-29' THEN 'February 2024'
        WHEN trip_date BETWEEN '2024-03-01' AND '2024-03-31' THEN 'March 2024'
    END AS month,
    COUNT(*) AS total_trips,
    SUM(fare_amount) AS total_revenue,
    ROUND(AVG(fare_amount), 2) AS avg_fare
FROM trips
WHERE trip_status = 'Completed'
GROUP BY month;

-- Q29. City-wise completed trip revenue
SELECT r.city,
       COUNT(t.trip_id) AS completed_trips,
       SUM(t.fare_amount) AS total_revenue
FROM riders r
INNER JOIN trips t ON r.rider_id = t.rider_id
WHERE t.trip_status = 'Completed'
GROUP BY r.city
ORDER BY total_revenue DESC;

-- Q30. UPI vs Cash vs Card: Success rate
SELECT payment_method,
       COUNT(*) AS total,
       SUM(CASE WHEN payment_status = 'Success' THEN 1 ELSE 0 END) AS success,
       ROUND(100.0 * SUM(CASE WHEN payment_status = 'Success' THEN 1 ELSE 0 END) / COUNT(*), 1) AS success_rate_pct
FROM payments
GROUP BY payment_method;
