-- Day 3 SQL Practice
-- Topic: JOINs (INNER JOIN, LEFT JOIN)
-- Author: Ann B Mariyam
-- Date: 30 November 2025
-- Description: Solutions to HackerRank JOIN questions + explanations.

-------------------------------------------------------
-- Problem 1: Population Census
-- Query the sum of the populations of all cities
-- where the CONTINENT is 'Asia'.
-------------------------------------------------------
SELECT SUM(c.POPULATION)
FROM CITY c
JOIN COUNTRY co
    ON c.COUNTRYCODE = co.CODE
WHERE co.CONTINENT = 'Asia';

-- Explanation:
-- We join CITY with COUNTRY to access the CONTINENT field.
-- WHERE filters to only Asia.
-- SUM aggregates all population values into a single number.
-- GROUP BY is NOT required since we want one value.

-------------------------------------------------------
-- Problem 2: African Cities
-- Query the NAMES of all cities where CONTINENT = 'Africa'.
-------------------------------------------------------
SELECT c.NAME
FROM CITY c
JOIN COUNTRY co
    ON c.COUNTRYCODE = co.CODE
WHERE co.CONTINENT = 'Africa';

-- Explanation:
-- CITY table does not contain CONTINENT, so JOIN is required.
-- INNER JOIN works because we only want matched rows.
-- LEFT JOIN is not needed (but would still work).

-------------------------------------------------------
-- Problem 3: Average Population of Each Continent
-------------------------------------------------------
SELECT co.CONTINENT,
       FLOOR(AVG(c.POPULATION)) AS avg_population
FROM CITY c
JOIN COUNTRY co
    ON c.COUNTRYCODE = co.CODE
GROUP BY co.CONTINENT;

-- Explanation:
-- AVG() calculates average population per continent.
-- FLOOR() rounds down to the nearest integer (HackerRank requirement).
-- GROUP BY groups the results by each continent.

-------------------------------------------------------
-- Problem 4: Combine Two Tables
-- Query firstName, lastName, city, and state
-- for each person. Include people with no address.
-------------------------------------------------------
SELECT p.firstName,
       p.lastName,
       a.city,
       a.state
FROM Person p
LEFT JOIN Address a
    ON a.personId = p.personId;

-- Explanation:
-- LEFT JOIN ensures we return all people from Person,
-- even if they have no matching address record in Address.

-------------------------------------------------------
-- Problem 5: Second Highest Salary
-- Return the 2nd highest DISTINCT salary.
-- If it does not exist, return NULL.
-------------------------------------------------------
SELECT
    (SELECT DISTINCT salary
     FROM Employee
     ORDER BY salary DESC
     LIMIT 1 OFFSET 1) AS SecondHighestSalary;

-- Explanation:
-- DISTINCT removes duplicate salary values.
-- ORDER BY salary DESC sorts salaries high -> low.
-- LIMIT 1 OFFSET 1 skips the highest salary and returns the 2nd.
-- If no second salary exists, this query returns NULL by default.

-------------------------------------------------------
-- End of Day 3 Practice
-------------------------------------------------------
