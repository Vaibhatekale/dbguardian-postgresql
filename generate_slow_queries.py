import psycopg2
import time

conn = psycopg2.connect(
    dbname="dbguardian",
    user="postgres",
    password="DB_PASSWORD",
    host="localhost",
    port="5432"
)

cur = conn.cursor()

print("Running slow query simulation...")

# Intentionally heavy queries
for i in range(5):
    cur.execute("""
        SELECT o.*, p.*
        FROM orders o
        JOIN products p ON o.product_id = p.product_id
        WHERE o.total_amount > 1000
        ORDER BY o.total_amount DESC;
    """)
    time.sleep(1)

cur.close()
conn.close()

print("Slow queries executed")