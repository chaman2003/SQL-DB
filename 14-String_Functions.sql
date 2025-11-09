-- STRING FUNCTIONS

-- Query 1: LENGTH function
SELECT LENGTH('hi') AS string_length;

-- Query 2: UPPER function
SELECT UPPER('hi') AS uppercase_text;

-- Query 3: LOWER function
SELECT LOWER('HI') AS lowercase_text;

-- Query 4: UPPER on column
SELECT UPPER(first_name) AS first_name_upper
FROM parks_and_recreation.employee_demographics;

-- Query 5: LOWER on column
SELECT LOWER(first_name) AS first_name_lower
FROM parks_and_recreation.employee_demographics;

-- Query 6: LENGTH with ORDER BY
SELECT 
  first_name,
  LENGTH(first_name) AS name_length
FROM parks_and_recreation.employee_demographics
ORDER BY 2;

-- Query 7: TRIM function (removes leading and trailing spaces)
SELECT TRIM('        meow       ') AS trimmed_text;

-- Query 8: LTRIM function (removes leading spaces)
SELECT LTRIM('        meow       ') AS left_trimmed_text;

-- Query 9: RTRIM function (removes trailing spaces)
SELECT RTRIM('        meow       ') AS right_trimmed_text;

-- Query 10: RTRIM on column
SELECT 
  first_name,
  RTRIM(first_name) AS trimmed_first_name
FROM parks_and_recreation.employee_demographics;

-- Query 11: LEFT function (extracts characters from left)
SELECT 
  first_name,
  LEFT(first_name, 2) AS first_two_chars
FROM parks_and_recreation.employee_demographics;

-- Query 12: RIGHT function (extracts characters from right)
SELECT 
  first_name,
  RIGHT(first_name, 2) AS last_two_chars
FROM parks_and_recreation.employee_demographics;

-- Query 13: SUBSTRING function
SELECT 
  first_name,
  SUBSTRING(first_name, 2, 3) AS substring_result,
  SUBSTRING(birth_date, 6, 2) AS birthday_month
FROM parks_and_recreation.employee_demographics;

-- Query 14: REPLACE function
SELECT 
  first_name,
  REPLACE(first_name, 'a', 'z') AS replaced_name
FROM parks_and_recreation.employee_demographics;

-- Query 15: LOCATE function (finds position of substring)
SELECT 
  first_name,
  LOCATE('e', first_name) AS position_of_e
FROM parks_and_recreation.employee_demographics;

-- Query 16: REVERSE function
SELECT 
  first_name,
  REVERSE(first_name) AS reversed_name
FROM parks_and_recreation.employee_demographics;

-- Query 17: REVERSE with LOCATE
SELECT 
  first_name,
  REVERSE(first_name) AS reversed_name,
  LOCATE('e', REVERSE(first_name)) AS position_of_e_in_reversed
FROM parks_and_recreation.employee_demographics;

-- Query 18: CONCAT function (combines multiple strings)
SELECT 
  first_name,
  last_name,
  CONCAT(first_name, ' ', last_name) AS full_name
FROM parks_and_recreation.employee_demographics;
