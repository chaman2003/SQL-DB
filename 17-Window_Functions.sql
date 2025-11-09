-- WINDOW FUNCTIONS

-- Query 1: Average salary partitioned by gender (basic window function)
SELECT
  ed.first_name,
  ed.last_name,
  ed.gender,
  AVG(salary) OVER (PARTITION BY gender) AS avg_salary_by_gender
FROM parks_and_recreation.employee_demographics AS ed
JOIN parks_and_recreation.employee_salary AS es
  ON ed.employee_id = es.employee_id;

-- Query 2: Average salary partitioned by gender (with ORDER BY)
SELECT
  ed.first_name,
  ed.last_name,
  ed.gender,
  AVG(salary) OVER (PARTITION BY gender ORDER BY ed.employee_id) AS avg_salary_by_gender
FROM parks_and_recreation.employee_demographics AS ed
JOIN parks_and_recreation.employee_salary AS es
  ON ed.employee_id = es.employee_id;

-- Query 3: Rolling sum of salary by gender
SELECT
  ed.first_name,
  ed.last_name,
  ed.gender,
  es.salary,
  SUM(salary) OVER (PARTITION BY gender ORDER BY ed.employee_id) AS rolling_salary_sum
FROM parks_and_recreation.employee_demographics AS ed
JOIN parks_and_recreation.employee_salary AS es
  ON ed.employee_id = es.employee_id;

-- Query 4: Row number by gender and salary
SELECT
  ed.first_name,
  ed.last_name,
  ed.gender,
  es.salary,
  ed.employee_id,
  ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary) AS salary_row_number
FROM parks_and_recreation.employee_demographics AS ed
JOIN parks_and_recreation.employee_salary AS es
  ON ed.employee_id = es.employee_id;

-- Query 5: Row number vs RANK by gender and salary (descending)
SELECT
  ed.first_name,
  ed.last_name,
  ed.gender,
  es.salary,
  ed.employee_id,
  ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary DESC) AS row_number,
  RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS salary_rank
FROM parks_and_recreation.employee_demographics AS ed
JOIN parks_and_recreation.employee_salary AS es
  ON ed.employee_id = es.employee_id;

-- Query 6: Row number vs RANK vs DENSE_RANK by gender and salary (descending)
SELECT
  ed.first_name,
  ed.last_name,
  ed.gender,
  es.salary,
  ed.employee_id,
  ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary DESC) AS row_number,
  RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS salary_rank,
  DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS dense_rank
FROM parks_and_recreation.employee_demographics AS ed
JOIN parks_and_recreation.employee_salary AS es
  ON ed.employee_id = es.employee_id;