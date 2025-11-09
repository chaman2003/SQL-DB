-- STORED PROCEDURES

-- Query 1: Basic Stored Procedure - No Parameters
-- Returns employees with salary >= 50000 (twice in this example)
DELIMITER $$
CREATE PROCEDURE stored_procedure1()
BEGIN 
  SELECT *
  FROM parks_and_recreation.employee_salary
  WHERE salary >= 50000;
  
  SELECT *
  FROM parks_and_recreation.employee_salary
  WHERE salary >= 50000;
END $$
DELIMITER ;

-- Call the stored procedure
CALL parks_and_recreation.stored_procedure1();

-- Query 2: Stored Procedure with Parameters
-- Returns salary for a specific employee based on employee_id
DELIMITER $$
CREATE PROCEDURE stored_procedure3(IN huggymuffin INT)
BEGIN
  SELECT salary
  FROM parks_and_recreation.employee_salary
  WHERE employee_id = huggymuffin;
END $$
DELIMITER ;

-- Call the stored procedure with parameter value 2
CALL parks_and_recreation.stored_procedure3(2);

-- Note: Stored procedures can have:
-- IN parameters: Input values passed to the procedure
-- OUT parameters: Output values returned by the procedure
-- INOUT parameters: Both input and output
