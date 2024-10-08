--1
CREATE DATABASE lab3;

--2
SELECT lastname FROM employees;

--3
SELECT DISTINCT lastname FROM employees;

--4
SELECT * FROM employees WHERE lastname = 'Smith';

--5
SELECT * FROM employees
WHERE lastname IN ('Smith', 'Doe');

--6
SELECT * FROM employees
WHERE department = 14;


--7
SELECT * FROM employees
WHERE department IN (37, 77);

--8
SELECT SUM(budget) AS total_budget
FROM departments;

--9
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;


--10
SELECT department
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;


--11
    SELECT name
FROM departments
ORDER BY budget DESC
OFFSET 1 LIMIT 1;


--12
    SELECT e.name, e.lastname
FROM employees e
JOIN departments d ON e.department = d.code
WHERE d.budget = (SELECT MIN(budget) FROM departments);


--13
    SELECT name, lastname
FROM employees
WHERE city = 'Almaty'
UNION
SELECT name, lastname
FROM customers
WHERE city = 'Almaty';



--14

SELECT *
  FROM departments
 WHERE budget > 60000
 ORDER BY budget ASC, code DESC;

--15
    UPDATE departments
SET budget = budget * 0.9
WHERE budget = (SELECT MIN(budget) FROM departments);


--16
    UPDATE employees
SET department = (SELECT code FROM departments WHERE name = 'IT')
WHERE department = (SELECT code FROM departments WHERE name = 'Research');


--17
    DELETE FROM employees
WHERE department = (SELECT code FROM departments WHERE name = 'IT');


--18
    DELETE FROM employees;

