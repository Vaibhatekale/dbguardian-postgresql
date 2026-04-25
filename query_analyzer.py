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
    SELECT id, query_text
    FROM query_stats_raw
    WHERE query_text IS NOT NULL
      AND (
            query_text ILIKE '%orders%'
         OR query_text ILIKE '%customers%'
         OR query_text ILIKE '%products%'
         OR query_text ILIKE '%payments%'
         OR query_text ILIKE '%users%'
      )
    ORDER BY captured_at DESC
    LIMIT 3;
""")

queries = cur.fetchall()

for item in queries:
    query_id = item[0]
    query_text = item[1].strip().rstrip(";")

    # Replace common pg_stat_statements placeholders with sample values
    query_text = query_text.replace("$1", "1000")
    query_text = query_text.replace("$2", "1")
    query_text = query_text.replace("$3", "'test'")

    try:
        explain_query = f"EXPLAIN ANALYZE {query_text}"
        cur.execute(explain_query)
        plan_rows = cur.fetchall()
        plan_text = "\n".join([row[0] for row in plan_rows])

        issue_notes = []

        if "Seq Scan" in plan_text:
            issue_notes.append("Sequential scan detected")
        if "Sort" in plan_text:
            issue_notes.append("Large sort operation detected")
        if "Index Scan" not in plan_text and "Seq Scan" in plan_text:
            issue_notes.append("Possible missing index")

        if not issue_notes:
            issue_notes.append("No major issue detected")

        cur.execute("""
            INSERT INTO incident_evidence (incident_id, evidence_type, details, created_at)
            VALUES (%s, %s, %s, %s)
        """, (
            1,
            "query_analysis",
            f"Query ID {query_id}: " + "; ".join(issue_notes),
            datetime.now()
        ))

    except Exception as e:
        conn.rollback()
        cur.execute("""
            INSERT INTO incident_evidence (incident_id, evidence_type, details, created_at)
            VALUES (%s, %s, %s, %s)
        """, (
            1,
            "query_analysis_error",
            f"Query ID {query_id}: analysis failed - {str(e)}",
            datetime.now()
        ))
        conn.commit()

conn.commit()
cur.close()
conn.close()

print("Query analysis completed")