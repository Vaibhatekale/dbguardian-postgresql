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

# Active connections
cur.execute("SELECT COUNT(*) FROM pg_stat_activity;")
active_connections = cur.fetchone()[0]

# Idle connections
cur.execute("SELECT COUNT(*) FROM pg_stat_activity WHERE state = 'idle';")
idle_connections = cur.fetchone()[0]

# Blocked queries
cur.execute("""
    SELECT COUNT(*)
    FROM pg_locks l1
    JOIN pg_locks l2
      ON l1.locktype = l2.locktype
     AND l1.database IS NOT DISTINCT FROM l2.database
     AND l1.relation IS NOT DISTINCT FROM l2.relation
     AND l1.page IS NOT DISTINCT FROM l2.page
     AND l1.tuple IS NOT DISTINCT FROM l2.tuple
     AND l1.virtualxid IS NOT DISTINCT FROM l2.virtualxid
     AND l1.transactionid IS NOT DISTINCT FROM l2.transactionid
     AND l1.classid IS NOT DISTINCT FROM l2.classid
     AND l1.objid IS NOT DISTINCT FROM l2.objid
     AND l1.objsubid IS NOT DISTINCT FROM l2.objsubid
    WHERE NOT l1.granted AND l2.granted;
""")
blocked_queries = cur.fetchone()[0]

# Deadlocks placeholder
deadlocks = 0

# Average query execution time
cur.execute("""
    SELECT COALESCE(AVG(mean_exec_time), 0)
    FROM pg_stat_statements;
""")
avg_query_ms = cur.fetchone()[0]

# P95-style approximation using max mean_exec_time
cur.execute("""
    SELECT COALESCE(MAX(mean_exec_time), 0)
    FROM pg_stat_statements;
""")
p95_query_ms = cur.fetchone()[0]

cur.execute("""
    INSERT INTO db_metrics_raw (
        captured_at,
        active_connections,
        idle_connections,
        blocked_queries,
        deadlocks,
        avg_query_ms,
        p95_query_ms
    )
    VALUES (%s, %s, %s, %s, %s, %s, %s)
""", (
    datetime.now(),
    active_connections,
    idle_connections,
    blocked_queries,
    deadlocks,
    avg_query_ms,
    p95_query_ms
))

conn.commit()
cur.close()
conn.close()

print("DB metrics inserted successfully")