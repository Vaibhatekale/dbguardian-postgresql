# DBGuardian — Autonomous PostgreSQL Support & Reliability Engineering Platform

DBGuardian is a PostgreSQL support and reliability engineering platform built using FastAPI and PostgreSQL.  
It helps detect database incidents, analyze slow queries, generate RCA reports, and provide optimization recommendations.

This project simulates real-world database reliability and support workflows using PostgreSQL, pgAdmin, Python scripts, and FastAPI APIs.

---

## 🚀 Features

- PostgreSQL database health monitoring
- Slow query tracking
- Incident detection API
- Query analysis endpoint
- Root Cause Analysis (RCA) reports
- Performance recommendation system
- FastAPI Swagger documentation
- PostgreSQL backup included
- Environment-based database configuration

---

## 🛠 Tech Stack

- Python
- FastAPI
- PostgreSQL
- pgAdmin
- SQL
- Uvicorn
- Python Dotenv

---

## 📁 Project Structure

```text
DBGuardian/
├── app/
├── data/
├── postgresql backup/
├── scripts/
├── screenshots/
├── .env.example
├── .gitignore
├── README.md
└── requirements.txt


📸 Screenshots
Project Structure

Swagger API Documentation

API Endpoints

API Schema Section

Health API

📸 Screenshots
Project Structure

Swagger API Documentation

API Endpoints

API Schema Section

Health API

Setup Instructions
1. Clone the repository
git clone https://github.com/your-username/dbguardian-postgresql.git
cd dbguardian-postgresql

Create virtual environment
python -m venv venv
venv\Scripts\activate

3.Install dependencies
pip install -r requirements.txt

4. Create .env file

Create a .env file in the project root:
DB_NAME=dbguardian
DB_USER=postgres
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432

Note: .env is ignored using .gitignore. Use .env.example as a reference.

Database Setup

Restore the PostgreSQL backup from:
postgresql backup/dbguardian.sql

Using pgAdmin:
Create Database → Open Query Tool → Open dbguardian.sql → Execute

Or using terminal:
psql -U postgres -d dbguardian -f "postgresql backup/dbguardian.sql"

Run the Project
uvicorn app.main:app --reload

Open Swagger UI:
http://127.0.0.1:8000/docs


How It Works
PostgreSQL Database
        ↓
Python Scripts / SQL Data
        ↓
Incident, Query, RCA, Recommendation Logic
        ↓
FastAPI API Layer
        ↓
Swagger Documentation
DBGuardian collects and exposes database-related information through APIs such as incidents, slow queries, RCA reports, and recommendations.

Use Cases
Detect slow database queries
Monitor PostgreSQL reliability data
Identify database incidents
Generate root cause analysis reports
Suggest performance optimizations
Demonstrate backend + database support skills

Why This Project Matters

DBGuardian is not a basic CRUD project.
It focuses on database reliability, support engineering, query debugging, RCA, and performance optimization.

This project is useful for:

Backend Developer roles
PostgreSQL Developer roles
Database Support Engineer roles
SRE / DevOps beginner roles

Future Improvements
Docker Compose setup
Grafana dashboard
Real-time alerting
Advanced query plan analysis
Automated remediation suggestions
Authentication for API access

Author

Vaibhav Tekale

