-- Alias: Use aliases for column names and filter using HAVING
SELECT 
  gender,
  AVG(age) AS avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 30;
