--lab2
--1
CREATE DATABASE lab2;
--2
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name TEXT,
    region_id INTEGER,
    population INTEGER
);

--3
INSERT INTO countries (country_name, region_id, population)
VALUES('Qazaqstan', 1337, 133337);

SELECT * FROM countries; --debug
SELECT * FROM countries_new; --debug

--4
INSERT INTO countries (country_id, country_name)
VALUES (1337, 'Russia');

-- 5.
INSERT INTO countries (country_name, region_id, population)
VALUES('Qazaqstan', NULL, 133337);

-- 6.
INSERT INTO countries (country_name, region_id, population)
VALUES
('Qazaqstan', 1337, 133337),
('Belarus', 1234, 2222),
('Deutschland', 90132, 1356);

--7.
ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

--8
INSERT INTO countries(region_id, population)
VALUES(1213, 1909);

--9
INSERT INTO countries DEFAULT VALUES;

--10
CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

--11
INSERT INTO countries_new SELECT * FROM countries;

--12
UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

--13
SELECT country_name, population * 1.10 AS "New Population"
FROM countries;

--14
DELETE FROM countries
WHERE population < 100000;

--15
DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

DELETE FROM countries_new AS t
WHERE exists(SELECT DISTINCT country_id FROM countries AS c WHERE c.country_id = t.country_id);

--16
DELETE FROM countries
RETURNING *;
