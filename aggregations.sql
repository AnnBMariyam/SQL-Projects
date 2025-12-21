-- Day 4 SQL Practice
-- Topic: Aggregations (SUM, AVG, COUNT), GROUP BY, HAVING
-- Author: Ann B Mariyam
-- Date: 1 December 2025
-- Description: Solutions to HackerRank and LeetCode aggregation questions with explanations.

-------------------------------------------------------
-- Problem 1: Sum of Northern Latitudes
-- Query the sum of LAT_N for all rows where LAT_N is
-- greater than 38.7880 and less than 137.2345.
-- Truncate the result to 4 decimal places.
-------------------------------------------------------
SELECT TRUNCATE(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880
  AND LAT_N < 137.2345;

-- Explanation:
-- WHERE filters the rows before aggregation.
-- SUM(LAT_N) computes the total latitude.
-- TRUNCATE(value, 4) cuts to 4 decimal places (no rounding).

-------------------------------------------------------
-- Problem 2: Top Earners
-- Return the maximum earnings (salary * months)
-- and the number of employees with that earning.
-------------------------------------------------------
SELECT MAX(salary * months) AS max_earnings,
       COUNT(*)
FROM Employee
WHERE salary * months = (SELECT MAX(salary * months) FROM Employee);

-- Explanation:
-- salary * months calculates total earnings.
-- The subquery finds the highest earning.
-- COUNT(*) gives how many employees have this earning.

-------------------------------------------------------
-- Problem 3: Duplicate Emails
-- Return all emails that appear more than once.
-------------------------------------------------------
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

-- Explanation:
-- GROUP BY groups by email.
-- HAVING COUNT(*) > 1 filters only duplicates.
-- WHERE cannot be used for aggregated filtering.

-------------------------------------------------------
-- Problem 4: Employees With Missing Information
-- An employee is missing information if:
--   1) Their name is NULL, OR
--   2) Their salary is NULL.
-- Return all such employee IDs in ascending order.
-------------------------------------------------------
SELECT employee_id
FROM (
    SELECT e.employee_id, e.name, s.salary
    FROM Employees e
    LEFT JOIN Salaries s USING (employee_id)
) t
WHERE name IS NULL OR salary IS NULL
ORDER BY employee_id;

-- Explanation:
-- LEFT JOIN keeps all employees, even those missing salary.
-- Using a subquery allows clean filtering of NULL fields.
-- IS NULL checks for missing values (never use = NULL).

-------------------------------------------------------
-- End of Day 4 Practice
-------------------------------------------------------
