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

    suggestions = []

    if title == "High Active Connections":
        suggestions.append(("Check connection pooling and close long-running idle sessions.", "high"))
        suggestions.append(("Check blocking session activity and transaction duration.", "medium"))

    elif title == "High API Latency":
        suggestions.append(("Rewrite query paths used by slow API endpoints.", "medium"))
        suggestions.append(("Reduce SELECT * usage and fetch only required columns.", "medium"))
        suggestions.append(("Create index on frequently filtered columns used by slow endpoints.", "high"))

    elif title == "Slow Queries Detected":
        cur.execute("""
            SELECT details
            FROM incident_evidence
            WHERE evidence_type = 'query_analysis'
            ORDER BY created_at DESC
            LIMIT 1;
        """)
        evidence = cur.fetchone()
        evidence_text = evidence[0] if evidence else ""

        if "Possible missing index" in evidence_text:
            suggestions.append(("Create index on columns used in WHERE, JOIN, or ORDER BY clauses.", "high"))

        if "Sequential scan detected" in evidence_text:
            suggestions.append(("Run ANALYZE and review table statistics for better query planning.", "medium"))

        if "Large sort operation detected" in evidence_text:
            suggestions.append(("Rewrite query to reduce heavy sorting and return only needed rows.", "medium"))

        suggestions.append(("Reduce SELECT * usage and fetch only required columns.", "medium"))

    elif title == "Blocked Queries Detected":
        suggestions.append(("Check blocking session and identify the transaction holding locks.", "high"))
        suggestions.append(("Review long-running transactions and reduce lock duration.", "medium"))

    elif title == "Lock Wait Detected":
        suggestions.append(("Check blocking session and inspect lock wait chains.", "high"))
        suggestions.append(("Rewrite conflicting update patterns to reduce lock contention.", "medium"))

    else:
        suggestions.append(("Review database logs and active queries for more details.", "low"))

    for suggestion, severity in suggestions:
        cur.execute("""
            INSERT INTO recommendations (suggestion, severity, created_at)
            VALUES (%s, %s, %s)
        """, (
            suggestion,
            severity,
            datetime.now()
        ))

conn.commit()
cur.close()
conn.close()

print("Recommendations generated successfully")