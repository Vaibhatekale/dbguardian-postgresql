import csv
import psycopg2

conn = psycopg2.connect(
    dbname="dbguardian",
    user="postgres",
    password="DB_PASSWORD",
    host="localhost",
    port="5432"
)

cur = conn.cursor()

with open("data/api_logs.csv", "r", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for row in reader:
        cur.execute("""
            INSERT INTO api_request_logs (
                requested_at,
                route,
                method,
                status_code,
                latency_ms,
                db_time_ms,
                trace_id
            )
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (
            row["requested_at"],
            row["route"],
            row["method"],
            int(row["status_code"]),
            int(row["latency_ms"]),
            int(row["db_time_ms"]),
            row["trace_id"]
        ))

conn.commit()
cur.close()
conn.close()

print("API logs inserted successfully")