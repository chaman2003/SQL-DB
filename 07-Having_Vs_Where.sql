-- Query 1: HAVING clause - filter groups after aggregation
-- Select gender groups where average age is greater than 39
SELECT 
  gender,
  MIN(age) AS min_age,
  MAX(age) AS max_age,
  COUNT(age) AS age_count,
  AVG(age) AS avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender 
HAVING AVG(age) > 39;

-- Query 2: WHERE clause with GROUP BY and HAVING
-- Select occupations containing 'Manager' with average salary > 50000
SELECT 
  occupation,
  AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%Manager%'
GROUP BY occupation
HAVING AVG(salary) > 50000;
