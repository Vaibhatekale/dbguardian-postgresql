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
    SELECT id, title, description
    FROM incidents
    WHERE status = 'open';
""")
incidents = cur.fetchall()

for incident in incidents:
    incident_id = incident[0]
    title = incident[1]
    description = incident[2]

    proof = ""
    root_cause = ""
    recommendation = ""

    if title == "High Active Connections":
        cur.execute("""
            SELECT active_connections, idle_connections
            FROM db_metrics_raw
            ORDER BY captured_at DESC
            LIMIT 1;
        """)
        metric = cur.fetchone()

        if metric:
            proof = f"Latest metrics show active_connections={metric[0]} and idle_connections={metric[1]}."
        else:
            proof = "No recent connection metrics found."

        root_cause = "Database is handling more active sessions than expected."
        recommendation = "Check connection pooling, long-running sessions, and application connection usage."

    elif title == "High API Latency":
        cur.execute("""
            SELECT route, latency_ms, db_time_ms
            FROM api_request_logs
            ORDER BY requested_at DESC
            LIMIT 1;
        """)
        metric = cur.fetchone()

        if metric:
            proof = f"Latest API log shows route={metric[0]}, latency_ms={metric[1]}, db_time_ms={metric[2]}."
        else:
            proof = "No recent API latency evidence found."

        root_cause = "API requests are taking longer than expected, likely due to slow database work or heavy request load."
        recommendation = "Check slow queries, reduce request load, and review API/database timing correlation."

    elif title == "Slow Queries Detected":
        cur.execute("""
            SELECT query_text, mean_exec_ms
            FROM query_stats_raw
            ORDER BY captured_at DESC
            LIMIT 1;
        """)
        metric = cur.fetchone()

        if metric:
            proof = f"Latest slow query evidence: mean_exec_ms={metric[1]}, query={metric[0][:120]}."
        else:
            proof = "No recent slow query evidence found."

        root_cause = "One or more SQL queries are taking longer than the allowed threshold."
        recommendation = "Review execution plan, add indexes where needed, and optimize expensive query patterns."

    elif title == "Blocked Queries Detected":
        cur.execute("""
            SELECT blocked_queries
            FROM db_metrics_raw
            ORDER BY captured_at DESC
            LIMIT 1;
        """)
        metric = cur.fetchone()

        if metric:
            proof = f"Latest metrics show blocked_queries={metric[0]}."
        else:
            proof = "No blocked query metrics found."

        root_cause = "Some sessions are blocked by locks held by other transactions."
        recommendation = "Check blocking sessions, transaction duration, and lock dependencies."

    elif title == "Lock Wait Detected":
        cur.execute("""
            SELECT blocked_queries
            FROM db_metrics_raw
            ORDER BY captured_at DESC
            LIMIT 1;
        """)
        metric = cur.fetchone()

        if metric:
            proof = f"Latest lock-related metric shows blocked_queries={metric[0]}."
        else:
            proof = "No lock wait metrics found."

        root_cause = "Sessions are waiting on locks before they can continue execution."
        recommendation = "Inspect lock holders, reduce transaction time, and review concurrent update patterns."

    else:
        proof = f"Incident description: {description}"
        root_cause = "Unknown issue detected."
        recommendation = "Investigate logs, metrics, and query activity."

    full_root_cause = f"Issue: {title}. Root cause: {root_cause}. Proof: {proof}"

    cur.execute("""
        INSERT INTO rca_reports (incident_id, root_cause, recommendation, created_at)
        VALUES (%s, %s, %s, %s)
    """, (
        incident_id,
        full_root_cause,
        recommendation,
        datetime.now()
    ))

conn.commit()
cur.close()
conn.close()

print("RCA reports generated successfully")