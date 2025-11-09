-- TEMPORARY TABLES

-- Query 1: Create and use a basic temporary table
CREATE TEMPORARY TABLE temp_table (
  movie VARCHAR(50),
  hero VARCHAR(50)
);

INSERT INTO temp_table
VALUES ('Baahubali', 'Prabhas');

SELECT *
FROM temp_table;

-- Query 2: Create temporary table from SELECT statement
CREATE TEMPORARY TABLE salary_above_50k AS
SELECT 
  ed.employee_id,
  ed.first_name,
  ed.last_name,
  es.salary
FROM parks_and_recreation.employee_demographics AS ed 
JOIN parks_and_recreation.employee_salary AS es
  ON ed.employee_id = es.employee_id
WHERE es.salary >= 50000;

-- Query 3: Select from temporary table
SELECT *
FROM salary_above_50k;

-- Note: Temporary tables are session-specific and automatically dropped 
-- when the session ends. They exist only during the current connection.
