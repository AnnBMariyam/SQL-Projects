-- Day 5 SQL Practice
-- Topic: Window Functions (Ranking + Analytics)
-- Author: Ann B Mariyam
-- Date: 4 December 2025
-- Description: Solutions to LeetCode window function problems.

-------------------------------------------------------
-- Problem 1: Rank Scores (LeetCode)
-- Goal: Assign rank to scores using DENSE_RANK().
-------------------------------------------------------

SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`
FROM Scores
ORDER BY score DESC;

-- Explanation:
-- DENSE_RANK() assigns ranks without skipping ties.
-- ORDER BY DESC ensures highest score = rank 1.
-- No PARTITION BY needed since all scores ranked together.

-------------------------------------------------------
-- Problem 2: Department Top Three Salaries (LeetCode)
-- Goal: Return top 3 salaries per department using window functions.
-------------------------------------------------------

SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT 
        *,
        DENSE_RANK() OVER (
            PARTITION BY departmentId 
            ORDER BY salary DESC
        ) AS rank_pos
    FROM Employee
) e
JOIN Department d
    ON d.id = e.departmentId
WHERE rank_pos <= 3;

-- Explanation:
-- DENSE_RANK() ranks salaries within each department.
-- Filtering where rank_pos <= 3 keeps top 3 DISTINCT salaries.
-- JOIN retrieves department names for display.

-------------------------------------------------------
-- End of Day 5 Practice
-------------------------------------------------------
