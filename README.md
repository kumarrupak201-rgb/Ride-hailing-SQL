# Ride-Hailing SQL Analysis

**Author:** Rupak Kumar  
**Institute:** Indian Institute of Technology Kanpur  
**Programme:** M.Tech, Transportation Engineering  
**Contact:** rupakk24@iitk.ac.in

---

## About This Project

I built this project to strengthen my understanding of relational databases and SQL querying. The dataset is modelled on how a ride-hailing platform such as Ola or Uber might structure its backend data — covering riders, drivers, trip records, payments, and ratings.

The queries progress from simple SELECT statements to multi-table JOINs and aggregation-based business analysis. All data is synthetic and was created solely for learning purposes.

---

## Database Structure

```
riders ──────┐
             ├──── trips ──── payments
drivers ─────┘         └──── ratings
```

| Table | Description | Records |
|-------|-------------|---------|
| `riders` | Customer details including city and total ride count | 15 |
| `drivers` | Driver profiles with vehicle category and active status | 10 |
| `trips` | Individual trip records with fare, distance, and status | 25 |
| `payments` | Payment mode and transaction status per trip | 25 |
| `ratings` | Post-trip ratings given to riders and drivers | 22 |

---

## Repository Contents

```
ride-hailing-sql/
│
├── schema.sql     → Table definitions with data types and foreign key constraints
├── data.sql       → Sample records inserted across all five tables
├── queries.sql    → Thirty SQL queries divided into five sections
└── README.md      → Project documentation
```

---

## SQL Topics Covered

**Section 1 — Basic Retrieval**  
Fundamental SELECT statements with WHERE and ORDER BY clauses. Queries filter trips by completion status, fare range, and trip date.

**Section 2 — Conditional Filtering**  
Use of BETWEEN, AND, and OR operators for range-based and compound filtering across multiple columns.

**Section 3 — Aggregation**  
Application of COUNT, SUM, AVG, MAX, and MIN with GROUP BY. Includes revenue breakdown by vehicle type, trip volume by city, and payment method frequency.

**Section 4 — Table Joins**  
INNER JOIN applied across two and three tables simultaneously. LEFT JOIN used to retain drivers with no associated trip records. This section forms the core of the analytical work.

**Section 5 — Business-Level Analysis**  
Queries that combine joins and aggregation to produce insights on monthly revenue, driver performance, city-wise demand, and payment success rates.

---

## Sample Queries

Total fare collected from completed trips:
```sql
SELECT SUM(fare_amount) AS total_revenue
FROM trips
WHERE trip_status = 'Completed';
```

Rider names joined with their respective trip details:
```sql
SELECT r.name, t.pickup_location, t.drop_location, t.fare_amount
FROM riders r
INNER JOIN trips t ON r.rider_id = t.rider_id;
```

Revenue and trip count grouped by vehicle category:
```sql
SELECT vehicle_type, COUNT(*) AS trips, SUM(fare_amount) AS revenue
FROM trips
WHERE trip_status = 'Completed'
GROUP BY vehicle_type
ORDER BY revenue DESC;
```

---

## Running the Project

**SQLite via Terminal**
```bash
sqlite3 ride_hailing.db
.read schema.sql
.read data.sql
.read queries.sql
```

**Google Colab**
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

**DB Browser for SQLite**  
A graphical interface available at https://sqlitebrowser.org/. After installation, create a new database, navigate to the Execute SQL tab, and run the three files in sequence.

---

## Observations from the Data

- SUV trips recorded the highest average fare among all vehicle categories at approximately Rs. 785 per trip.
- UPI was the most frequently used payment method, accounting for nearly 44 percent of all transactions.
- Riders registered in Delhi generated the highest cumulative trip volume.
- Approximately 12 percent of all bookings had a cancelled status.
- Among drivers, Sunil Mishra recorded the highest number of completed trips at 870.

---

## Technical Skills Used

`SQL` `SQLite` `Relational Database Design` `JOINs` `Aggregation` `Data Analysis`

---

## Connect

[LinkedIn](your-linkedin-url) | [GitHub](your-github-url)
