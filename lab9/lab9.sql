
--1
CREATE OR REPLACE FUNCTION increase_value(val INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN val + 10;
END;
$$ LANGUAGE plpgsql;

-- 2
CREATE OR REPLACE FUNCTION compare_numbers(a INTEGER, b INTEGER, OUT result TEXT)
AS $$
BEGIN
    IF a > b THEN
        result := 'Greater';
    ELSIF a = b THEN
        result := 'Equal';
    ELSE
        result := 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- 3
CREATE OR REPLACE FUNCTION number_series(n INTEGER)
RETURNS TABLE(series INTEGER) AS $$
BEGIN
    FOR series IN 1..n LOOP
        RETURN NEXT;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

--  4
CREATE OR REPLACE FUNCTION find_employee(emp_name TEXT)
RETURNS TABLE(employee_id INTEGER, employee_name TEXT, employee_position TEXT) AS $$
BEGIN
    RETURN QUERY SELECT id, name, position FROM employees WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;

--  5
CREATE OR REPLACE FUNCTION list_products(category TEXT)
RETURNS TABLE(product_id INTEGER, product_name TEXT, product_price NUMERIC) AS $$
BEGIN
    RETURN QUERY SELECT id, name, price FROM products WHERE category = category;
END;
$$ LANGUAGE plpgsql;

--  6
CREATE OR REPLACE FUNCTION calculate_bonus(salary NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    RETURN salary * 0.1;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(emp_id INTEGER)
RETURNS VOID AS $$
DECLARE
    current_salary NUMERIC;
    bonus NUMERIC;
BEGIN
    SELECT salary INTO current_salary FROM employees WHERE id = emp_id;
    bonus := calculate_bonus(current_salary);
    UPDATE employees SET salary = salary + bonus WHERE id = emp_id;
END;
$$ LANGUAGE plpgsql;

--  7
CREATE OR REPLACE FUNCTION complex_calculation(num1 INTEGER, str1 VARCHAR)
RETURNS TEXT AS $$
DECLARE
    numeric_result INTEGER;
    string_result VARCHAR;
    final_result TEXT;
BEGIN
    numeric_result := num1 * 10;

    string_result := UPPER(str1) || ' PROCESSED';

    final_result := 'Numeric: ' || numeric_result || ', String: ' || string_result;

    RETURN final_result;
END;
$$ LANGUAGE plpgsql;