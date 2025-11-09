-- LIMIT clause: Return first 3 rows
SELECT 
  occupation,
  AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation
LIMIT 3;
