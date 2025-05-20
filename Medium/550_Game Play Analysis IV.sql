-- Question Link :- https://leetcode.com/problems/game-play-analysis-iv/
-- Game Play Analysis IV


-- Table: Activity

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+

-- (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-03-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+

-- Output: 
-- +-----------+
-- | fraction  |
-- +-----------+
-- | 0.33      |
-- +-----------+
-- Explanation: 
-- Only the player with id 1 logged back in after the first day he had logged in so the answer is 1/3 = 0.33



-- Solution - 1 [14/15 test case passed]
SELECT ROUND(COUNT(t2.player_id)/COUNT(t1.player_id), 2) AS fraction
FROM (SELECT player_id, MIN(event_date) as first_login
      FROM Activity
      GROUP BY player_id) t1 
LEFT JOIN Activity t2
ON t1.player_id = t2.player_id AND t2.event_date - t1.first_login = 1




-- Solution - 2 [15/15 test case passed]
SELECT ROUND(COUNT(t2.player_id)/COUNT(t1.player_id), 2) AS fraction
FROM (SELECT player_id, MIN(event_date) as first_login
      FROM Activity
      GROUP BY player_id) t1 
LEFT JOIN Activity t2
ON t1.player_id = t2.player_id AND DATEDIFF(t2.event_date, t1.first_login) = 1



-- Another method
WITH cte AS (
    SELECT player_id, MIN(event_date) as first_login
    FROM Activity
    GROUP BY player_id
)

SELECT ROUND(COUNT(t2.player_id)/COUNT(t1.player_id), 2) AS fraction
FROM cte t1 
LEFT JOIN Activity t2
ON t1.player_id = t2.player_id AND DATEDIFF(t2.event_date, t1.first_login) = 1



-- this subquery will give the first login date of each player

-- | player_id | first_login |
-- | --------- | ----------- |
-- | 1         | 2016-03-01  |
-- | 2         | 2017-06-25  |
-- | 3         | 2016-03-02  |