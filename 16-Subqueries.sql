-- SUBQUERIES

-- Query 1: Subquery in WHERE clause
-- Get all employees in department 1
SELECT *
FROM parks_and_recreation.employee_demographics 
WHERE employee_id IN (
  SELECT employee_id 
  FROM employee_salary 
  WHERE dept_id = 1
);

-- Query 2: Scalar subquery
-- Show salary compared to average salary
SELECT 
  salary,
  (SELECT AVG(salary) FROM parks_and_recreation.employee_salary) AS avg_salary_all_employees
FROM parks_and_recreation.employee_salary;

-- Query 3: Subquery in FROM clause
-- Calculate average of maximum ages by gender
SELECT AVG(max_age) AS avg_of_max_ages
FROM (
  SELECT 
    gender,
    AVG(age) AS avg_age,
    MIN(age) AS min_age,
    MAX(age) AS max_age 
  FROM employee_demographics
  GROUP BY gender
) AS age_statistics;
