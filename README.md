# 🎬 Netflix SQL Analytics Project
A production-scale SQL analytics project simulating a real-world streaming platform like Netflix.
This project demonstrates data modeling, large-scale data generation, and advanced analytics using SQL.

---

## 📌 Project Overview

This repository includes:

* Fully normalized relational database schema
* Synthetic data generation (~500K+ rows)
* 50+ advanced SQL queries
* Real-world analytics use cases

The goal is to simulate how companies like Netflix analyze user behavior, engagement, and revenue.

---

## 🏗️ Repository Structure

📦 netflix-sql-project
┣ 📂 assets
┃ ┗ 📄 netflix_schema_diagram.png
┣ 📂 schema
┃ ┣ 📄 01_create_tables.sql
┃ ┗ 📄 02_insert_data.sql
┣ 📂 queries
┃ ┗ 📄 03_all_queries.sql
┗ 📄 README.md

---

## 🧠 Key Concepts Covered

### 1. Data Modeling

* Normalized schema design
* Fact and dimension tables
* Many-to-many relationships
* Foreign keys and indexing

Schema file reference: 

---

### 2. Large-Scale Data Simulation

* 10,000 users generated using SQL logic
* ~500K+ watch history records
* Realistic distributions:

  * User engagement levels
  * Device usage patterns
  * Content popularity
  * Subscription churn

---

### 3. Advanced SQL Analytics

Queries file reference: 

Includes:

* Basic analytics (top movies, user segmentation)
* Window functions (rank, lag, lead, ntile)
* Engagement analysis (completion %, binge watching)
* Revenue analytics (MRR, churn rate)
* Churn prediction logic
* Recommendation system (co-watch analysis)
* Cohort retention analysis
* Lifetime value (LTV) modeling

---

## ⚙️ Setup Instructions

1. Clone the repository

git clone https://github.com/AnanyaSharma2/Netflix-Analysis-SQL.git
cd netflix-sql-project

2. Run SQL files in order

Step 1: Create schema
source schema/01_create_tables.sql;

Step 2: Insert data
source schema/02_insert_data.sql;

Step 3: Run queries
source queries/03_all_queries.sql;

---

## 📊 Database Overview

Main tables:

* users
* movies
* watch_history
* user_subscriptions

Supporting tables:

* genres, actors, directors
* movie_genres, movie_actors, movie_directors

---

## 🚀 Key Features

* Real-world scalable schema
* Advanced SQL (CTEs, window functions)
* Large dataset simulation
* Indexed for performance
* Covers data analyst + data engineer concepts

---

## 📌 Example Insights

* Identify high-value users
* Detect churn risk users
* Analyze genre performance
* Measure subscription revenue
* Build recommendation logic

---

## ⚠️ Known Issues

* One join condition typo (movie_id - movie_id instead of =)
* Can be improved with:

  * Partitioning
  * Materialized views
  * Dashboard integration

---

## 📚 Learning Outcomes

* Advanced SQL querying
* Data modeling best practices
* Analytical thinking
* Real-world business problem solving

---

## 👨‍💻 Author

Ananya Sharma

---

## ⭐ If you like this project

Give it a star ⭐ and use it for:

* Resume projects
* Interview preparation
* Portfolio showcase

---

## 🔥 Future Improvements

* Power BI / Tableau dashboard
* Python (Pandas) integration
* ETL pipeline (Airflow/dbt)
* Data warehouse modeling

---
