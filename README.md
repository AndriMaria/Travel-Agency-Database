# ✈️ Travel Agency Database

## About
A Travel Agency Database built with MySQL, developed collaboratively with 2 teammates as part of our Database course in university.

## 🛠️ Technologies
- **MySQL**

## 📊 Database Diagram
![Database Diagram](diagram.png)

## 🏗️ Database Structure

| Table | Description |
|---|---|
| `destination` | Travel destinations (local/abroad) |
| `branch` | Agency branches |
| `worker` | All employees |
| `driver` | Drivers with license info |
| `guide` | Tour guides with languages |
| `trip` | Trips with dates, cost and seats |
| `reservation` | Seat reservations per trip |
| `event` | Events during a trip |
| `travel_to` | Destinations per trip |
| `offers` | Special offers |
| `reservation_offers` | Client reservations for offers |
| `log` | IT action log |

## ⚙️ How to Run
1. Install **MySQL**
2. Run the files in this order:
   - `CREATE.sql` — creates the database and tables
   - `INSERT.sql` — inserts the data
   - Procedures & Triggers — run last

## 📖 The Process
We started by designing the database schema, defining the tables and their relationships. Then we added the data with INSERT statements. Finally we implemented stored procedures, triggers and indexes to add more functionality and optimize performance.

## 🚀 How It Can Be Improved
- Add more complex queries and views
- Improve error handling in procedures
- Add more indexes for better performance
- Add user roles and permissions
- Normalize the database further

## 🎓 What I Learned
- **Database Design** — Designing tables with foreign keys and constraints
- **Stored Procedures** — Writing procedures for complex queries
- **Triggers** — Automating actions on insert, update and delete
- **Indexes** — Optimizing query performance

---
🎓 *University Database project | First SQL project*
