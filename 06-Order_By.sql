-- Query 1: Order by age (ascending) and then gender
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age ASC, gender ASC;

-- Query 2: Order by gender (ascending) and then age (descending)
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender ASC, age DESC;
