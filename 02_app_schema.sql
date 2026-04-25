CREATE TABLE users (
    user_id INT PRIMARY KEY,
    full_name TEXT,
    email TEXT,
    city TEXT,
    created_at TIMESTAMP
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT,
    region TEXT,
    signup_date TIMESTAMP
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price INT,
    stock_quantity INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount INT,
    order_status TEXT,
    order_date TIMESTAMP
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method TEXT,
    payment_status TEXT,
    paid_amount INT,
    paid_at TIMESTAMP
);