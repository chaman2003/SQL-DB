-- Query 1: Group salary data by department
SELECT 
  dept_id,
  AVG(salary) AS avg_salary,
  MIN(salary) AS min_salary,
  MAX(salary) AS max_salary,
  COUNT(salary) AS salary_count
FROM parks_and_recreation.employee_salary
GROUP BY dept_id;

-- Query 2: Group demographics data by gender
SELECT 
  gender,
  MIN(age) AS min_age,
  MAX(age) AS max_age,
  COUNT(age) AS age_count,
  AVG(age) AS avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender;
