-- Author: Ann B Mariyam
-- Topic: Common SQL Questions

-------------------------------------------------------
-- Q1: Find duplicate employee names
-------------------------------------------------------
SELECT name
FROM employees
GROUP BY name
HAVING COUNT(*) > 1;

-------------------------------------------------------
-- Q2: Find highest salary per department
-------------------------------------------------------
SELECT department,
       MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-------------------------------------------------------
-- Q3: Countries with more than 5 customers
-------------------------------------------------------
SELECT country,
       COUNT(*) AS customer_count
FROM customers
GROUP BY country
HAVING COUNT(*) > 5;


-------------------------------------------------------
-- Q4: LeetCode: Duplicate Emails
-------------------------------------------------------
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

-------------------------------------------------------
-- Q5: LeetCode: Customers Who Never Order
-------------------------------------------------------
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
    ON c.id = o.customerId
WHERE o.customerId IS NULL;

