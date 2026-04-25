import psycopg2
import time

conn = psycopg2.connect(
    dbname="dbguardian",
    user="postgres",
    password="DB_PASSWORD",
    host="localhost",
    port="5432"
)

conn.autocommit = False
cur = conn.cursor()

print("Starting lock scenario...")

cur.execute("BEGIN;")
cur.execute("UPDATE orders SET order_status = 'pending' WHERE order_id = 1;")

print("Row lock created on orders.order_id = 1")
print("Keep this terminal open for 30 seconds...")

time.sleep(30)

conn.commit()
cur.close()
conn.close()

print("Lock released")