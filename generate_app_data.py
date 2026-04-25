import csv
import random
from datetime import datetime, timedelta
from pathlib import Path

DATA_DIR = Path("data")
DATA_DIR.mkdir(exist_ok=True)

random.seed(42)

cities = ["Mumbai", "Pune", "Delhi", "Bengaluru", "Hyderabad", "Chennai"]
regions = ["North", "South", "East", "West", "Central"]
categories = ["Laptop", "Phone", "Accessory", "Tablet", "Monitor"]
order_statuses = ["pending", "shipped", "delivered", "cancelled"]
payment_methods = ["UPI", "Card", "NetBanking", "Wallet"]
payment_statuses = ["success", "failed", "pending"]


def random_date(days_back=365):
    now = datetime.now()
    return (now - timedelta(
        days=random.randint(0, days_back),
        hours=random.randint(0, 23),
        minutes=random.randint(0, 59),
        seconds=random.randint(0, 59)
    )).isoformat()


def write_csv(filename, fieldnames, rows):
    with open(DATA_DIR / filename, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def generate_users():
    rows = []
    for i in range(1, 101):
        rows.append({
            "user_id": i,
            "full_name": f"User {i}",
            "email": f"user{i}@test.com",
            "city": random.choice(cities),
            "created_at": random_date(365)
        })
    write_csv(
        "users.csv",
        ["user_id", "full_name", "email", "city", "created_at"],
        rows
    )


def generate_customers():
    rows = []
    for i in range(1, 201):
        rows.append({
            "customer_id": i,
            "customer_name": f"Customer {i}",
            "region": random.choice(regions),
            "signup_date": random_date(700)
        })
    write_csv(
        "customers.csv",
        ["customer_id", "customer_name", "region", "signup_date"],
        rows
    )


def generate_products():
    rows = []
    for i in range(1, 101):
        rows.append({
            "product_id": i,
            "product_name": f"Product {i}",
            "category": random.choice(categories),
            "price": random.randint(100, 5000),
            "stock_quantity": random.randint(0, 300)
        })
    write_csv(
        "products.csv",
        ["product_id", "product_name", "category", "price", "stock_quantity"],
        rows
    )


def generate_orders():
    rows = []
    for i in range(1, 1001):
        quantity = random.randint(1, 5)
        price_per_unit = random.randint(100, 5000)
        rows.append({
            "order_id": i,
            "customer_id": random.randint(1, 200),
            "product_id": random.randint(1, 100),
            "quantity": quantity,
            "total_amount": quantity * price_per_unit,
            "order_status": random.choice(order_statuses),
            "order_date": random_date(500)
        })
    write_csv(
        "orders.csv",
        [
            "order_id",
            "customer_id",
            "product_id",
            "quantity",
            "total_amount",
            "order_status",
            "order_date"
        ],
        rows
    )


def generate_payments():
    rows = []
    for i in range(1, 1001):
        rows.append({
            "payment_id": i,
            "order_id": random.randint(1, 1000),
            "payment_method": random.choice(payment_methods),
            "payment_status": random.choice(payment_statuses),
            "paid_amount": random.randint(100, 10000),
            "paid_at": random_date(500)
        })
    write_csv(
        "payments.csv",
        [
            "payment_id",
            "order_id",
            "payment_method",
            "payment_status",
            "paid_amount",
            "paid_at"
        ],
        rows
    )


if __name__ == "__main__":
    generate_users()
    generate_customers()
    generate_products()
    generate_orders()
    generate_payments()
    print("App data generated successfully in data folder")