 --1
CREATE database lab4;

--2
CREATE TABLE Warehouses
(
    code     SERIAL PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);

CREATE TABLE Boxes
(
    code      CHAR(4) PRIMARY KEY,
    contents  VARCHAR(255),
    value     REAL,
    warehouse INT REFERENCES Warehouses (code) ON DELETE CASCADE
);

--3 i didnt found lab4.sql, so i just copy from the pdf
INSERT INTO Warehouses(location, capacity)
VALUES ('Chicago', 3),
       ('Chicago', 4),
       ('New-York', 7),
       ('Los-Angeles', 2),
       ('San-Francisco', 8);

drop database lab4;

INSERT INTO Boxes (code, contents, value, warehouse)
VALUES ('0MN7', 'Rocks', 180, 3),
       ('4H8P', 'Rocks', 250, 1),
       ('4RT3', 'Scissors', 190, 4),
       ('7G3H', 'Rocks', 200, 1),
       ('8JN6', 'Papers', 75, 1),
       ('8Y6U', 'Papers', 50, 3),
       ('9J6F', 'Papers', 175, 2),
       ('LL08', 'Rocks', 140, 4),
       ('P0H6', 'Scissors', 125, 1),
       ('P2T6', 'Scissors', 150, 2),
       ('TU55', 'Papers', 90, 5);

--4
SELECT *
FROM Warehouses;

--5
SELECT *
FROM Boxes
WHERE VALUE > 150;

--6
SELECT DISTINCT contents
FROM Boxes;

--7
SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse;

--8
SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) > 2;


--9
INSERT INTO Warehouses(location, capacity)
VALUES ('New-York', 3);

--10
INSERT INTO Boxes(code, contents, value, warehouse)
values ('H5RT', 'Papers', 200, 2);

--11
WITH RankedBoxes AS (SELECT code,
                            value,
                            ROW_NUMBER() OVER (ORDER BY value DESC) AS rank
                     FROM Boxes)

UPDATE Boxes
SET value = value * 0.9
WHERE code = (SELECT code
              FROM RankedBoxes
              WHERE rank = 3);

SELECT * FROM Boxes; --debug
--12
DELETE
FROM Boxes
WHERE value < 150;

--13
DELETE
FROM Boxes
WHERE warehouse IN (SELECT code
                    FROM Warehouses
                    WHERE location = 'New-York')
RETURNING *;


--meow meow meow
drop table boxes;
drop table warehouses;