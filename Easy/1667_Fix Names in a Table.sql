-- Question Link :- https://leetcode.com/problems/fix-names-in-a-table
-- Fix Names in a Table


-- Table: Users

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | user_id        | int     |
-- | name           | varchar |
-- +----------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
 

-- Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

-- Return the result table ordered by user_id.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Users table:
-- +---------+-------+
-- | user_id | name  |
-- +---------+-------+
-- | 1       | aLice |
-- | 2       | bOB   |
-- +---------+-------+

-- Output: 
-- +---------+-------+
-- | user_id | name  |
-- +---------+-------+
-- | 1       | Alice |
-- | 2       | Bob   |
-- +---------+-------+


-- Solution 1
SELECT user_id , CONCAT(UPPER(SUBSTR(name, 1, 1)), LOWER(SUBSTR(name, 2))) AS name 
FROM Users
ORDER BY user_id

-- SUBSTR(string_name , start_index ,end_index)



-- Solution 2
SELECT user_id , CONCAT(UPPER(LEFT(name,1)), LOWER(RIGHT(name, length(name)-1))) AS name 
FROM Users
ORDER BY user_id

-- RIGHT(name_of_string, no_of_charachters) 