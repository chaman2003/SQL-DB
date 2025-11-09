-- Logical operators: AND conditions
-- Fetch males aged 38 or younger born in the 1980s
SELECT age, gender, birth_date
FROM parks_and_recreation.employee_demographics
WHERE (age <= 38 AND gender = 'Male') 
  AND birth_date LIKE '198%';
