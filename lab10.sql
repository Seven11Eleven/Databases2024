--1
BEGIN;

INSERT INTO Orders (book_id, customer_id, order_date, quantity)
VALUES (1, 101, CURRENT_DATE, 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;

COMMIT;

--2
BEGIN;

INSERT INTO Orders (book_id, customer_id, order_date, quantity)
VALUES (3, 102, CURRENT_DATE, 10);

DO $$
BEGIN
    IF (SELECT quantity FROM Books WHERE book_id = 3) < 10 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END $$;

--3
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN;
UPDATE Books
SET price = 45.00
WHERE book_id = 1;


SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN;
SELECT price FROM Books WHERE book_id = 1;

COMMIT;

SELECT price FROM Books WHERE book_id = 1;
COMMIT;

--4
BEGIN;

UPDATE Customers
SET email = 'meow@example.com'
WHERE customer_id = 101;

COMMIT;

SELECT * FROM Customers WHERE customer_id = 101;
