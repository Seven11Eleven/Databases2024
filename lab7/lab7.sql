--1
CREATE INDEX idx_countries_name on countries using hash (name);

--2
CREATE INDEX idx_employees_name_surname ON employees using hash (name, surname);

--3 вообще по дефолту юзается бинарное дерево насколько я помню,
-- но я решил указать явно, на всякий случай
CREATE UNIQUE INDEX idx_employees_salary ON employees using btree (salary);

--4
CREATE INDEX idx_employees_name_substr ON employees using hash ((substring(name from 1 for 4)));

--5
CREATE INDEX idx_employees_departments_budget_salary ON employees (department_id, salary);
CREATE INDEX idx_departments_budget ON departments (budget);





