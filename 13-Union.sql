-- UNION: Combine multiple queries
-- Labels for different employee categories

-- Category 1: Old men (age > 50)
SELECT 
  first_name,
  last_name,
  'Old man' AS label
FROM employee_demographics
WHERE age > 50 AND gender = 'Male'

UNION

-- Category 2: Old women (age > 50)
SELECT 
  first_name,
  last_name,
  'Old woman' AS label
FROM employee_demographics
WHERE age > 50 AND gender = 'Female'

UNION

-- Category 3: Highly paid employees (salary > 70000)
SELECT 
  first_name,
  last_name,
  'Highly paid employee' AS label
FROM employee_salary
WHERE salary > 70000

UNION

-- Category 4: Less paid employees (salary < 70000)
SELECT 
  first_name,
  last_name,
  'Less paid employee' AS label
FROM employee_salary
WHERE salary < 70000

ORDER BY first_name, last_name;
