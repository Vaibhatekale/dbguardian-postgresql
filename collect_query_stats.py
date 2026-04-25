import psycopg2
from datetime import datetime

conn = psycopg2.connect(
    dbname="dbguardian",
    user="postgres",
    password="DB_PASSWORD",
    host="localhost",
    port="5432"
)

cur = conn.cursor()

cur.execute("""
    SELECT query, calls, total_exec_time, mean_exec_time, rows
    FROM pg_stat_statements
    WHERE (
        query ILIKE '%orders%'
        OR query ILIKE '%customers%'
        OR query ILIKE '%products%'
        OR query ILIKE '%payments%'
        OR query ILIKE '%users%'
    )
    AND query NOT ILIKE '%pg_stat_statements%'
    ORDER BY total_exec_time DESC
    LIMIT 5;
""")

rows = cur.fetchall()

for row in rows:
    cur.execute("""
        INSERT INTO query_stats_raw (
            captured_at,
            query_text,
            calls,
            total_exec_ms,
            mean_exec_ms,
            rows_processed
        )
        VALUES (%s, %s, %s, %s, %s, %s)
    """, (
        datetime.now(),
        row[0],
        row[1],
        row[2],
        row[3],
        row[4]
    ))

conn.commit()
cur.close()
conn.close()

print("Query stats inserted successfully")