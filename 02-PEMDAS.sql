-- Query 1: Order of operations (PEMDAS) - age + (10*10)/2
SELECT age + (10 * 10) / 2 AS calculated_value
FROM parks_and_recreation.employee_demographics;

-- Query 2: Select distinct multiple columns
SELECT DISTINCT gender, first_name
FROM parks_and_recreation.employee_demographics;
