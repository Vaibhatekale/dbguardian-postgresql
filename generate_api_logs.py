import csv
import random
import uuid
from datetime import datetime, timedelta
from pathlib import Path

DATA_DIR = Path("data")
DATA_DIR.mkdir(exist_ok=True)

routes = [
    "/api/orders",
    "/api/customers",
    "/api/products",
    "/api/payments"
]

methods = ["GET", "POST"]
status_codes = [200, 200, 200, 201, 400, 404, 500]

def random_datetime():
    now = datetime.now()
    return (now - timedelta(
        days=random.randint(0, 30),
        hours=random.randint(0, 23),
        minutes=random.randint(0, 59),
        seconds=random.randint(0, 59)
    )).isoformat()

rows = []
for i in range(1, 1001):
    latency = random.randint(50, 2000)
    rows.append({
        "requested_at": random_datetime(),
        "route": random.choice(routes),
        "method": random.choice(methods),
        "status_code": random.choice(status_codes),
        "latency_ms": latency,
        "db_time_ms": random.randint(10, latency),
        "trace_id": str(uuid.uuid4())
    })

with open(DATA_DIR / "api_logs.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=[
        "requested_at", "route", "method",
        "status_code", "latency_ms", "db_time_ms", "trace_id"
    ])
    writer.writeheader()
    writer.writerows(rows)

print("API logs generated successfully")