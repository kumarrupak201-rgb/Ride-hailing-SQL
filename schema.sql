-- ============================================
-- RIDE-HAILING DATABASE (Ola/Uber Style)
-- Project by: Rupak Kumar | IIT Kanpur
-- ============================================

-- Drop tables if they exist (for re-runs)
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS riders;

-- ============================================
-- TABLE 1: RIDERS
-- ============================================
CREATE TABLE riders (
    rider_id      INTEGER PRIMARY KEY,
    name          TEXT NOT NULL,
    city          TEXT NOT NULL,
    phone         TEXT,
    joined_date   DATE,
    total_rides   INTEGER DEFAULT 0
);

-- ============================================
-- TABLE 2: DRIVERS
-- ============================================
CREATE TABLE drivers (
    driver_id       INTEGER PRIMARY KEY,
    name            TEXT NOT NULL,
    city            TEXT NOT NULL,
    vehicle_type    TEXT CHECK(vehicle_type IN ('Auto', 'Mini', 'Sedan', 'SUV')),
    is_active       INTEGER DEFAULT 1,   -- 1 = active, 0 = inactive
    joined_date     DATE,
    total_trips     INTEGER DEFAULT 0
);

-- ============================================
-- TABLE 3: TRIPS
-- ============================================
CREATE TABLE trips (
    trip_id         INTEGER PRIMARY KEY,
    rider_id        INTEGER,
    driver_id       INTEGER,
    pickup_location TEXT NOT NULL,
    drop_location   TEXT NOT NULL,
    trip_date       DATE NOT NULL,
    distance_km     REAL NOT NULL,
    fare_amount     REAL NOT NULL,
    trip_status     TEXT CHECK(trip_status IN ('Completed', 'Cancelled', 'Ongoing')),
    vehicle_type    TEXT,
    FOREIGN KEY (rider_id) REFERENCES riders(rider_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- ============================================
-- TABLE 4: PAYMENTS
-- ============================================
CREATE TABLE payments (
    payment_id      INTEGER PRIMARY KEY,
    trip_id         INTEGER,
    payment_method  TEXT CHECK(payment_method IN ('Cash', 'UPI', 'Card', 'Wallet')),
    amount          REAL NOT NULL,
    payment_status  TEXT CHECK(payment_status IN ('Success', 'Failed', 'Pending')),
    payment_date    DATE,
    FOREIGN KEY (trip_id) REFERENCES trips(trip_id)
);

-- ============================================
-- TABLE 5: RATINGS
-- ============================================
CREATE TABLE ratings (
    rating_id       INTEGER PRIMARY KEY,
    trip_id         INTEGER,
    rider_rating    REAL CHECK(rider_rating BETWEEN 1 AND 5),
    driver_rating   REAL CHECK(driver_rating BETWEEN 1 AND 5),
    feedback        TEXT,
    FOREIGN KEY (trip_id) REFERENCES trips(trip_id)
);
