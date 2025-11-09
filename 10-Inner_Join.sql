-- Query 1: INNER JOIN - All columns
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
  ON sal.employee_id = dem.employee_id;

-- Query 2: INNER JOIN - Specific columns
SELECT 
  dem.age,
  dem.gender,
  sal.salary
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
  ON sal.employee_id = dem.employee_id;

-- Query 3: Self JOIN - Join table to itself
SELECT 
  sal1.employee_id AS eid_1,
  sal1.first_name AS fn_1,
  sal1.last_name AS ln_1,
  sal2.employee_id AS eid_2,
  sal2.first_name AS fn_2,
  sal2.last_name AS ln_2
FROM employee_salary AS sal1
INNER JOIN employee_salary AS sal2
  ON sal1.employee_id + 1 = sal2.employee_id;
