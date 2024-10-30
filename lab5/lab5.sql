--1
CREATE DATABASE lab5;

--2
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id) ON DELETE CASCADE
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brada Guzan', 'London', 100, 5005),
(3004, 'Fabin Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);

INSERT INTO salesman (salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Berlin', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);


--3
SELECT SUM(purch_amt) FROM orders;

--4
SELECT AVG(purch_amt) FROM orders;

SELECT (SUM(orders.purch_amt)/COUNT(orders.purch_amt)) FROM orders;

SELECT STDDEV
--5
SELECT COUNT(cust_name) FROM customers;

--6
SELECT MIN(purch_amt) FROM orders;

--7
SELECT * FROM customers WHERE cust_name LIKE '%n%a%';

--8
SELECT * FROM orders--10
full JOIN customers --5
    ON orders.customer_id = customers.customer_id--3
WHERE customers.city = 'New York';
union = 3 a = 7 b = 2

--9
SELECT * FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.purch_amt > 10;0?.,mj bvcz GFFDSxv,

--10
SELECT SUM(grade) FROM customers;

--11
SELECT cust_name FROM customers WHERE cust_name IS NOT NULL;

--12
SELECT MAX(grade) FROM customers;
