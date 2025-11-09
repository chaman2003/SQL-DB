-- TRIGGERS

-- Query 1: Create a Trigger - Executed after INSERT
-- This trigger logs employee information to an audit_log table
DELIMITER $$
CREATE TRIGGER employee_insert
AFTER INSERT
ON parks_and_recreation.employee_salary
FOR EACH ROW
BEGIN
  INSERT INTO parks_and_recreation.audit_log (employee_id, first_name, last_name)
  VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

-- Test the trigger by inserting data
INSERT INTO parks_and_recreation.employee_salary 
  (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES 
  (101, 'John', 'Doe', 'Developer', 55000, NULL);

-- Note: Triggers automatically execute based on:
-- BEFORE/AFTER: Timing of trigger execution
-- INSERT/UPDATE/DELETE: The event that fires the trigger
-- FOR EACH ROW: Executes for every row affected
-- NEW: References new values being inserted/updated
-- OLD: References old values being updated/deleted
