-- Query 1: WHERE clause with LIKE pattern (_e%)
-- Pattern: any single character followed by 'e' and then any characters
SELECT first_name, age
FROM parks_and_recreation.employee_demographics
WHERE age > 18 
  AND first_name LIKE '_e%';

-- Query 2: WHERE clause with LIKE pattern (_e_)
-- Pattern: exactly 3 characters with 'e' in the middle
SELECT first_name, age
FROM parks_and_recreation.employee_demographics
WHERE age > 18 
  AND first_name LIKE '_e_';

-- Query 3: All employees from demographics table
SELECT *
FROM parks_and_recreation.employee_demographics;
