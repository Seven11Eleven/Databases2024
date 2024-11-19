--  1
CREATE DATABASE lab8;
--  2

CREATE TABLE salesman (
    salesman_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    grade INT
);
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    salesman_id INT REFERENCES salesman(salesman_id),
    customer_id INT REFERENCES customers(customer_id)
);
--  3
CREATE ROLE junior_dev LOGIN;
--  4
CREATE VIEW salesmen_new_york AS
SELECT *
FROM salesman
WHERE city = 'New York';
--  5
CREATE VIEW order_details AS
SELECT
    orders.order_id,
    orders.order_date,
    salesman.name AS salesman_name,
    customers.name AS customer_name,
    orders.amount
FROM orders
JOIN salesman ON orders.salesman_id = salesman.salesman_id
JOIN customers ON orders.customer_id = customers.customer_id;

GRANT ALL PRIVILEGES ON TABLE order_details TO junior_dev;
--  6
CREATE VIEW highest_grade_customers AS
SELECT *
FROM customers
WHERE grade = (SELECT MAX(grade) FROM customers);

GRANT SELECT ON TABLE highest_grade_customers TO junior_dev;
-- 7
CREATE VIEW salesman_count_per_city AS
SELECT city, COUNT(*) AS salesman_count
FROM salesman
GROUP BY city;
-- 8
CREATE VIEW salesman_with_multiple_customers AS
SELECT
    s.salesman_id,
    s.name AS salesman_name,
    COUNT(o.customer_id) AS customer_count
FROM salesman s
JOIN orders o ON s.salesman_id = o.salesman_id
GROUP BY s.salesman_id, s.name
HAVING COUNT(o.customer_id) > 1;
-- 9
CREATE ROLE intern;
GRANT junior_dev TO intern;