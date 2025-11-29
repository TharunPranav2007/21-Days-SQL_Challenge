# 🏥 Hospital Data Analytics - 21 Days SQL Challenge

![SQL](https://img.shields.io/badge/SQL-MySQL-orange)
![Status](https://img.shields.io/badge/Status-Completed-green)
![Focus](https://img.shields.io/badge/Focus-Data_Analytics-blue)

[![LinkedIn](https://img.icons8.com/color/48/linkedin-circled--v1.png)](https://www.linkedin.com/in/tharunpranavt)

## 📄 Overview
This repository contains my solutions for the **21 Days SQL Challenge**, organized by **Indian Data Club** and sponsored by **dpdzero**.

Over three weeks, I transformed a raw database of hospital records into actionable insights using MySQL. The journey progressed from basic data retrieval to complex reporting, culminating in a full-scale **Hospital Performance Dashboard** on Day 21.

---

## 📂 Repository Structure

```text
21-Days-SQL-Challenge/
│
├── README.md                        # Project overview, tech stack, and setup guide
├── Daily_Challenges/                # Daily SQL solutions
│   ├── Day_01.sql                   # Introduction & DISTINCT
│   ├── Day_02.sql                   # Filtering with WHERE
│   ├── ...
│   └── Day_21.sql                   # 🏆 The Final Dashboard Project
│
└── Datasets/                        # Raw data files
    ├── patients.csv
    ├── staff.csv
    ├── services_weekly.csv
    └── staff_schedule.csv
```
---
## 🛠️ Tech Stack

**Database:** MySQL

**Key SQL Concepts Applied:**
- Data Cleaning: Handling NULLs (COALESCE), String Functions (UPPER, CONCAT), Date Arithmetic (DATEDIFF)
- Logic: CASE Statements, Conditional Aggregation
- Relationships: INNER JOIN, LEFT JOIN, UNION, UNION ALL
- Advanced Analytics: Window Functions (RANK, ROW_NUMBER, Running Totals, Moving Averages)
- Architecture: Subqueries (Scalar, Correlated) and Common Table Expressions (CTEs)

---

## 📅 The 21-Day Curriculum

| Week | Focus Area | Key Concepts |
|------|------------|--------------|
| **Week 1** | Foundations | SELECT, DISTINCT, WHERE, ORDER BY, LIMIT, Aggregates (SUM, AVG), GROUP BY, HAVING |
| **Week 2** | Data Shaping | String Functions, Date Arithmetic, CASE Logic, NULL Handling, INNER JOIN, LEFT JOIN |
| **Week 3** | Advanced SQL | Multiple Joins, Subqueries (WHERE, SELECT, FROM), UNION, Window Functions, CTEs |

---

## 🏆 Project Highlight: Day 21 Dashboard

The final challenge (`Daily_Challenges/Day_21.sql`) involved building a **Comprehensive Hospital Performance Dashboard**.

### **Goal**
Rank hospital services based on a weighted performance score.

### **Method**
Using 3 linked Common Table Expressions (CTEs), the process combined:
- **ServiceMetrics** – Aggregated operational metrics (Admissions vs. Refusals)
- **StaffMetrics** – Staff assignment vs. staff present
- **PatientMetrics** – Demographic summaries

### **Result**
A single SQL query that generates a **ranked performance leaderboard** of all hospital departments.

---

### ⚙️ How to Use This Repo

**1️⃣ Clone the Repository**
```bash
git clone https://github.com/YOUR-USERNAME/21-Days-SQL-Challenge.git
```

**2️⃣ Import the Data**
Create a MySQL database named ```hospital```

Import CSV files from the ```Datasets/``` directory into these tables:

•```patients```
•```staff```
•```services_weekly```
•```staff_schedule```

**3️⃣ Run SQL Queries**

Open any file in the ```Daily_Challenges/``` folder to view:

•The challenge/problem statement

•The SQL solution

---

### 🙌 Acknowledgements

A huge thank you to **Indian Data Club** for the structured SQL curriculum and **DPDZero** for sponsoring this 21-day learning challenge.

---

## 🔗 Connect With Me

[![LinkedIn](https://img.icons8.com/ios-filled/50/0A66C2/linkedin.png)](https://www.linkedin.com/in/tharunpranavt)
