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


def load_csv(file_path, insert_query, columns):
    with open(file_path, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            values = [row[col] for col in columns]
            cur.execute(insert_query, values)


load_csv(
    "data/users.csv",
    """
    INSERT INTO users (user_id, full_name, email, city, created_at)
    VALUES (%s, %s, %s, %s, %s)
    """,
    ["user_id", "full_name", "email", "city", "created_at"]
)

load_csv(
    "data/customers.csv",
    """
    INSERT INTO customers (customer_id, customer_name, region, signup_date)
    VALUES (%s, %s, %s, %s)
    """,
    ["customer_id", "customer_name", "region", "signup_date"]
)

load_csv(
    "data/products.csv",
    """
    INSERT INTO products (product_id, product_name, category, price, stock_quantity)
    VALUES (%s, %s, %s, %s, %s)
    """,
    ["product_id", "product_name", "category", "price", "stock_quantity"]
)

load_csv(
    "data/orders.csv",
    """
    INSERT INTO orders (order_id, customer_id, product_id, quantity, total_amount, order_status, order_date)
    VALUES (%s, %s, %s, %s, %s, %s, %s)
    """,
    ["order_id", "customer_id", "product_id", "quantity", "total_amount", "order_status", "order_date"]
)

load_csv(
    "data/payments.csv",
    """
    INSERT INTO payments (payment_id, order_id, payment_method, payment_status, paid_amount, paid_at)
    VALUES (%s, %s, %s, %s, %s, %s)
    """,
    ["payment_id", "order_id", "payment_method", "payment_status", "paid_amount", "paid_at"]
)

conn.commit()
cur.close()
conn.close()

print("Seed data loaded successfully")