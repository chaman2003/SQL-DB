-- Query 1: LEFT OUTER JOIN
-- Returns all records from left table, matching records from right table
SELECT *
FROM employee_demographics AS dem
LEFT OUTER JOIN employee_salary AS sal
  ON sal.employee_id = dem.employee_id;

-- Query 2: RIGHT OUTER JOIN
-- Returns all records from right table, matching records from left table
SELECT *
FROM employee_demographics AS dem
RIGHT OUTER JOIN employee_salary AS sal
  ON sal.employee_id = dem.employee_id;
