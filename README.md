# 🛵 Ride-Hailing SQL Analysis Project
### Ola / Uber Style Database — SQL Beginner Project

**Author:** Rupak Kumar  
**Institute:** Indian Institute of Technology Kanpur (M.Tech Transportation Engineering)  
**Tools:** SQL (SQLite compatible)

---

## 📌 Project Overview

This project simulates a real-world **ride-hailing platform database** (similar to Ola / Uber / Rapido) and demonstrates core SQL skills through structured analysis queries.

The database covers **riders, drivers, trips, payments, and ratings** — and answers key business questions using SQL.

---

## 🗄️ Database Schema

```
riders ──────┐
             ├──── trips ──── payments
drivers ─────┘         └──── ratings
```

| Table | Description | Rows |
|-------|-------------|------|
| `riders` | Customer profiles with city & ride history | 15 |
| `drivers` | Driver profiles with vehicle type & status | 10 |
| `trips` | Trip records with fare, distance, status | 25 |
| `payments` | Payment method & status per trip | 25 |
| `ratings` | Rider & driver ratings with feedback | 22 |

---

## 📂 Files

```
ride-hailing-sql/
│
├── schema.sql     → Create all 5 tables with constraints
├── data.sql       → Insert sample data (riders, drivers, trips, etc.)
├── queries.sql    → 30 analysis queries (5 sections)
└── README.md      → Project documentation
```

---

## 🔍 SQL Concepts Covered

### Section 1 — Basic SELECT
- `SELECT`, `WHERE`, `ORDER BY`
- Filtering by status, date, fare amount

### Section 2 — Filtering & Conditions
- `BETWEEN`, `AND`, `OR`
- String matching with `=`

### Section 3 — Aggregate Functions
- `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`
- `GROUP BY`, `ORDER BY`
- Revenue by vehicle type, payment method usage

### Section 4 — JOINS ⭐
- `INNER JOIN` — Rider + Trip details
- `LEFT JOIN` — Drivers with 0 trips included
- 3-Table JOIN — Rider + Trip + Payment

### Section 5 — Business Insights
- Top riders and drivers
- Monthly revenue summary
- City-wise performance
- Payment success rate analysis

---

## 💡 Sample Queries

**Total revenue from completed trips:**
```sql
SELECT SUM(fare_amount) AS total_revenue
FROM trips
WHERE trip_status = 'Completed';
```

**Rider name with their trip details (JOIN):**
```sql
SELECT r.name, t.pickup_location, t.drop_location, t.fare_amount
FROM riders r
INNER JOIN trips t ON r.rider_id = t.rider_id;
```

**Revenue by vehicle type:**
```sql
SELECT vehicle_type, COUNT(*) AS trips, SUM(fare_amount) AS revenue
FROM trips
WHERE trip_status = 'Completed'
GROUP BY vehicle_type
ORDER BY revenue DESC;
```

---

## 🚀 How to Run

### Option 1: SQLite (Offline)
```bash
sqlite3 ride_hailing.db
.read schema.sql
.read data.sql
.read queries.sql
```

### Option 2: Google Colab (Online)
```python
import sqlite3
import pandas as pd

conn = sqlite3.connect(':memory:')

with open('schema.sql') as f:
    conn.executescript(f.read())

with open('data.sql') as f:
    conn.executescript(f.read())

# Run any query
df = pd.read_sql_query("SELECT * FROM trips", conn)
print(df)
```

### Option 3: DB Browser for SQLite
- Download: https://sqlitebrowser.org/
- Open → New Database → Execute SQL tab → Run files in order

---

## 📊 Key Insights from Data

- **SUV trips** generate highest average fare (₹785)
- **UPI** is the most popular payment method
- **Delhi riders** make the most total trips
- **Cancelled trip rate** = 12% of all bookings
- Driver **Sunil Mishra** has highest total trips (870)

---

## 🛠️ Skills Demonstrated

`SQL` `SQLite` `Database Design` `JOINs` `Aggregation` `Data Analysis` `Transportation Analytics`

---

## 📬 Contact

**Rupak Kumar**  
M.Tech Transportation Engineering, IIT Kanpur  
📧 rupakk24@iitk.ac.in  
🔗 [LinkedIn](your-linkedin-url) | [GitHub](your-github-url)
