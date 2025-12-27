-- Topic: Basic SELECT Queries
-- Author: Ann B Mariyam
-- Date: 29 November 2025
-- Description: Solutions to HackerRank Basic Select exercises + explanations.

-------------------------------------------------------
-- Problem 1: Revising the Select Query I
-------------------------------------------------------
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA'
  AND POPULATION > 100000;

-------------------------------------------------------
-- Problem 2: Revising the Select Query II
-------------------------------------------------------
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA'
  AND POPULATION > 120000;

-------------------------------------------------------
-- Problem 3: Select All
-------------------------------------------------------
SELECT *
FROM CITY;

-------------------------------------------------------
-- Problem 4: Select By ID
-------------------------------------------------------
SELECT *
FROM CITY
WHERE ID = 1661;

-------------------------------------------------------
-- Problem 5: Japanese Cities Attributes
-------------------------------------------------------
SELECT *
FROM CITY
WHERE COUNTRYCODE LIKE 'JPN';

-- Explanation:
-- HackerRank expects the use of LIKE instead of = in this problem.
-- Even though = 'JPN' works perfectly in real SQL,
-- LIKE 'JPN' matches the exact same value.
--
-- LIKE is normally used for patterns:
--     LIKE 'A%'  → starts with A
--     LIKE '%on' → ends with on
--     LIKE '%mar%' → contains mar
--
-- But here, HackerRank uses LIKE to teach the syntax.

-------------------------------------------------------
-- Problem 6: Japanese Cities Names
-------------------------------------------------------
SELECT NAME
FROM CITY
WHERE COUNTRYCODE IN ('JPN');

-- Explanation:
-- HackerRank expects the IN operator for this problem.
-- In real SQL, both are valid:
--     COUNTRYCODE = 'JPN'
--     COUNTRYCODE IN ('JPN')
--
-- But HackerRank forces IN (...) so learners practice the syntax.

-------------------------------------------------------
-- End of Day 2 Practice
-------------------------------------------------------
