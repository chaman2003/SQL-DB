-- EVENTS (Scheduled Tasks)

-- Query 1: Create an Event - Automatically delete retirees
-- This event runs every 30 seconds and removes employees older than 65
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
  DELETE
  FROM parks_and_recreation.employee_demographics
  WHERE age > 65;
END $$
DELIMITER ;

-- Note: Events are scheduled tasks that execute automatically based on:
-- ON SCHEDULE: When the event should run
-- EVERY: Repeating intervals (SECOND, MINUTE, HOUR, DAY, MONTH, YEAR)
-- AT: Specific date and time for one-time execution
-- DO: The SQL statement(s) to execute

-- Other Event Examples:
-- Run once at specific time:
--   ON SCHEDULE AT '2025-12-31 23:59:59'
-- 
-- Run daily:
--   ON SCHEDULE EVERY 1 DAY
--
-- Run monthly:
--   ON SCHEDULE EVERY 1 MONTH STARTS '2025-01-01 00:00:00'

-- To view all events:
-- SHOW EVENTS;

-- To disable/enable an event:
-- ALTER EVENT event_name DISABLE;
-- ALTER EVENT event_name ENABLE;

-- To drop an event:
-- DROP EVENT event_name;
