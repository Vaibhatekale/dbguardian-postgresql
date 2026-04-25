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

# Rule 1: active connections > threshold
cur.execute("""
    SELECT COUNT(*)
    FROM db_metrics_raw
    WHERE active_connections > 10;
""")
high_connection_count = cur.fetchone()[0]

# Rule 2: API latency high
cur.execute("""
    SELECT COUNT(*)
    FROM api_request_logs
    WHERE latency_ms > 1500;
""")
high_latency_count = cur.fetchone()[0]

# Rule 3: slow query > threshold
cur.execute("""
    SELECT COUNT(*)
    FROM query_stats_raw
    WHERE mean_exec_ms > 500;
""")
slow_query_count = cur.fetchone()[0]

# Rule 4: blocked query found
cur.execute("""
    SELECT COUNT(*)
    FROM db_metrics_raw
    WHERE blocked_queries > 0;
""")
blocked_query_count = cur.fetchone()[0]

# Rule 5: lock wait found
cur.execute("""
    SELECT COUNT(*)
    FROM db_metrics_raw
    WHERE blocked_queries > 0;
""")
lock_wait_count = cur.fetchone()[0]


def create_incident(title, severity, description):
    cur.execute("""
        INSERT INTO incidents (
            title,
            severity,
            status,
            created_at,
            updated_at,
            description
        )
        VALUES (%s, %s, %s, %s, %s, %s)
    """, (
        title,
        severity,
        "open",
        datetime.now(),
        datetime.now(),
        description
    ))


if high_connection_count > 0:
    create_incident(
        "High Active Connections",
        "high",
        "Active connections exceeded threshold"
    )

if high_latency_count > 0:
    create_incident(
        "High API Latency",
        "medium",
        "API latency exceeded threshold"
    )

if slow_query_count > 0:
    create_incident(
        "Slow Queries Detected",
        "high",
        "One or more queries exceeded the execution time threshold"
    )

if blocked_query_count > 0:
    create_incident(
        "Blocked Queries Detected",
        "high",
        "Blocked queries were detected from lock activity"
    )

if lock_wait_count > 0:
    create_incident(
        "Lock Wait Detected",
        "medium",
        "Sessions appear to be waiting on locks"
    )

conn.commit()
cur.close()
conn.close()

print("Incident detection completed")