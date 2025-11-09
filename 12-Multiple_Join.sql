-- Multiple JOINs: Connect three tables
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
  ON sal.employee_id = dem.employee_id
INNER JOIN parks_departments AS pd
  ON sal.dept_id = pd.department_id;
