CREATE DATABASE midterm;

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    job_title VARCHAR(50)
);

INSERT INTO employees (name, job_title) VALUES
('John', 'Manager'),
('Alice', 'Analyst'),
('Bob', 'Clerk'),
('Chris', 'Engineer'),
('Dave', 'CEO'),
('ThatOneGuyWhoHasJobTitleLess3', 'HR'),
('Eve', 'Secretary'),
('Sam', 'Technician'),
('Lee', 'Manager'),
('Kay', 'Analyst');

TRUNCATE employees;

SELECT * FROM employees;

--

SELECT name, employees.job_title
from employees
WHERE job_title LIKE '__'
--просто __ вернет только те, записи, где только три символа
-- условно ____% вернет все записи, которые как минимум начинаются с четырех символов(т.е СЕО и HR не войдут)

--------------------------------------------------


CREATE TABLE sales_data (
    id SERIAL PRIMARY KEY,
    department_id INT,
    sales NUMERIC
);

INSERT INTO sales_data (department_id, sales) VALUES
(1, 50),   -- Sales less than 100
(1, 200),  -- Sales more than 100
(2, 150),  -- Sales more than 100
(2, 70),   -- Sales less than 100
(3, 120),  -- Sales more than 100
(3, 30),   -- Sales less than 100
(4, 10),  -- Sales more than 100
(4, 30);   -- Sales less than 100
truncate sales_data;
SELECT department_id, SUM(sales) AS total_sales
FROM sales_data
GROUP BY department_id;

SELECT department_id, SUM(sales) AS total_sales
FROM sales_data
GROUP BY department_id
HAVING SUM(sales) >= 100;

SELECT department_id, SUM(CASE WHEN sales >= 100 THEN sales ELSE 0 END) AS total_sales
FROM sales_data
GROUP BY department_id

 CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO users (name) VALUES
('Джеймс'),
('Джони'),
('Даниал'),
('Анна'),
('Мария'),
('Михаил'),
('Алексей'),
('Ольга'),
('Сергей'),
('Виктор');

CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    group_name VARCHAR(50)
);

INSERT INTO groups (group_name) VALUES
(NULL),  -- это можно оставить строкой или заменить на SQL NULL, если таково намерение
('первая'),
('вторая'),
('третья'),
('четвертая'),
('пятая'),
('шестая'),
('седьмая'),
('восьмая'),
('девятая');


SELECT *
FROM users
FULL JOIN groups ON 1=1;

SELECT *
FROM users
CROSS JOIN groups;

drop table users;
drop table groups;


CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(50)
);

INSERT INTO groups (group_name) VALUES
('первая'),
('вторая'),
('третья'),
('четвертая');
truncate table groups, users   ;
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    group_id INT REFERENCES groups(group_id)
);

INSERT INTO users (name, group_id) VALUES
('Джеймс', 1),
('Джони', 2),
('Даниал', 3),
('Анна', 1),
('Мария', 2),
('Сергей', NULL);

select * from groups;

SELECT *
FROM users
CROSS JOIN groups;

SELECT *
FROM users
FULL JOIN groups
ON users.group_id = groups.group_id;

SELECT *
FROM users
FULL JOIN groups ON 1=1;

SELECT *
FROM users
    FULL JOIN groups
ON users.group_id = groups.group_id;
