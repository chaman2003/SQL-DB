-- CASE STATEMENTS

-- Query 1: Basic CASE statement with age categories
SELECT 
  first_name,
  last_name,
  age,
  CASE
    WHEN age >= 50 THEN 'Hello Death'
    WHEN age <= 20 THEN 'Hello Minor'
    WHEN age BETWEEN 21 AND 49 THEN 'Hello Major'
  END AS age_category
FROM parks_and_recreation.employee_demographics;

-- Query 2: CASE with salary increase (by salary amount)
SELECT 
  sal.first_name,
  sal.last_name,
  sal.salary,
  sal.dept_id,
  dept.department_id,
  CASE 
    WHEN salary > 50000 THEN salary + (salary * 0.07)
    WHEN salary <= 50000 THEN salary + (salary * 0.05)
    WHEN sal.dept_id = 6 THEN salary + (salary * 0.1)
  END AS updated_salary
FROM parks_and_recreation.employee_salary AS sal
JOIN parks_and_recreation.parks_departments AS dept
  ON sal.dept_id = dept.department_id;

-- Query 3: CASE with salary increase (by department name)
SELECT 
  sal.first_name,
  sal.last_name,
  sal.salary,
  sal.dept_id,
  dept.department_name,
  CASE 
    WHEN dept.department_name = 'Finance' THEN sal.salary * 1.10
    WHEN sal.salary > 50000 THEN sal.salary + (sal.salary * 0.07)
    WHEN sal.salary <= 50000 THEN sal.salary + (sal.salary * 0.05)
  END AS updated_salary
FROM parks_and_recreation.employee_salary AS sal
JOIN parks_and_recreation.parks_departments AS dept
  ON sal.dept_id = dept.department_id;
