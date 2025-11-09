-- COMMON TABLE EXPRESSIONS (CTE)

-- Query 1: Basic CTE - Calculate average age statistics by gender
WITH cte AS 
(
  SELECT 
    gender,
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    AVG(age) AS avg_age
  FROM parks_and_recreation.employee_demographics AS ed
  JOIN parks_and_recreation.employee_salary AS es
    ON ed.employee_id = es.employee_id
  GROUP BY gender
)
SELECT AVG(avg_age) AS overall_avg_age
FROM cte;

-- Query 2: Nested CTEs - Multiple CTEs in one query
WITH cte1 AS 
(
  SELECT employee_id, gender
  FROM parks_and_recreation.employee_demographics
  WHERE gender = 'Male'
),
cte2 AS 
(
  SELECT employee_id, salary
  FROM parks_and_recreation.employee_salary
  WHERE salary >= 50000
)
SELECT *
FROM cte1
JOIN cte2
  ON cte1.employee_id = cte2.employee_id;
