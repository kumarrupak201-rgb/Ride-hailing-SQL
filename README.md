# Ride-Hailing SQL Analysis Project
### A beginner-level SQL project modeled on platforms like Ola and Uber

**Author:** Rupak Kumar  
**Institute:** Indian Institute of Technology Kanpur (M.Tech Transportation Engineering)  
**Tools:** SQL (SQLite compatible)

---

## Overview

This project builds a relational database that simulates how a ride-hailing platform stores and manages its data. The goal was to practice core SQL skills — writing queries, joining tables, and deriving simple business insights from raw records.

The database tracks five things: riders, drivers, trips, payments, and ratings. Using these, I wrote 30 queries that answer practical questions a data analyst might actually face working at a company like Ola or Rapido.

---

## Database Schema

```
riders ──────┐
             ├──── trips ──── payments
drivers ─────┘         └──── ratings
```

| Table | Description | Rows |
|-------|-------------|------|
| `riders` | Customer profiles with city and ride history | 15 |
| `drivers` | Driver profiles with vehicle type and active status | 10 |
| `trips` | Trip records with fare, distance, and completion status | 25 |
| `payments` | Payment method and status for each trip | 25 |
| `ratings` | Rider and driver ratings with feedback text | 22 |

---

## Files in this Repository

```
ride-hailing-sql/
│
├── schema.sql     → Creates all 5 tables with constraints and foreign keys
├── data.sql       → Inserts sample data across all tables
├── queries.sql    → 30 analysis queries organized into 5 sections
└── README.md      → This file
```

---

## SQL Concepts Covered

**Section 1 — Basic SELECT**  
Simple retrieval using SELECT, WHERE, and ORDER BY. Filtering trips by status, fare range, and date.

**Section 2 — Filtering and Conditions**  
Using BETWEEN, AND, OR for range-based and multi-condition filtering.

**Section 3 — Aggregate Functions**  
COUNT, SUM, AVG, MAX, MIN with GROUP BY. Covers revenue by vehicle type, trip counts by city, and payment method breakdown.

**Section 4 — Joins**  
INNER JOIN across two and three tables, LEFT JOIN to include drivers with no trips. This is the most important section for real-world SQL work.

**Section 5 — Business Insights**  
Combining everything above to answer questions like monthly revenue trends, top-performing drivers, city-wise demand, and payment success rates.

---

## Sample Queries

Total revenue from completed trips:
```sql
SELECT SUM(fare_amount) AS total_revenue
FROM trips
WHERE trip_status = 'Completed';
```

Rider names with their trip details:
```sql
SELECT r.name, t.pickup_location, t.drop_location, t.fare_amount
FROM riders r
INNER JOIN trips t ON r.rider_id = t.rider_id;
```

Revenue broken down by vehicle type:
```sql
SELECT vehicle_type, COUNT(*) AS trips, SUM(fare_amount) AS revenue
FROM trips
WHERE trip_status = 'Completed'
GROUP BY vehicle_type
ORDER BY revenue DESC;
```

---

## How to Run

**Option 1 — SQLite (Offline)**
```bash
sqlite3 ride_hailing.db
.read schema.sql
.read data.sql
.read queries.sql
```

**Option 2 — Google Colab (Online)**
```python
import sqlite3
import pandas as pd

conn = sqlite3.connect(':memory:')

with open('schema.sql') as f:
    conn.executescript(f.read())

with open('data.sql') as f:
    conn.executescript(f.read())

df = pd.read_sql_query("SELECT * FROM trips", conn)
print(df)
```

**Option 3 — DB Browser for SQLite**  
Download from https://sqlitebrowser.org/, create a new database, and run the three SQL files in order from the Execute SQL tab.

---

## Key Findings

- SUV trips have the highest average fare at roughly Rs. 785 per ride
- UPI is the most used payment method across all transactions
- Riders from Delhi account for the highest trip volume
- Around 12% of all bookings were cancelled
- Driver Sunil Mishra has the most total trips completed (870)

---

## Skills Demonstrated

`SQL` `SQLite` `Relational Database Design` `JOINs` `Aggregation` `Data Analysis` `Transportation Domain`

---

## Contact

**Rupak Kumar**  
M.Tech Transportation Engineering, IIT Kanpur  
rupakk24@iitk.ac.in  
[LinkedIn](your-linkedin-url) | [GitHub](your-github-url)
