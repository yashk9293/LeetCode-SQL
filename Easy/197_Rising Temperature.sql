-- Question Link :- https://leetcode.com/problems/rising-temperature/
-- Rising Temperature


-- Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

-- +---------+------------------+------------------+
-- | Id(INT) | RecordDate(DATE) | Temperature(INT) |
-- +---------+------------------+------------------+
-- |       1 |       2015-01-01 |               10 |
-- |       2 |       2015-01-02 |               25 |
-- |       3 |       2015-01-03 |               20 |
-- |       4 |       2015-01-04 |               30 |
-- +---------+------------------+------------------+
-- For example, return the following Ids for the above Weather table:

-- +----+
-- | Id |
-- +----+
-- |  2 |
-- |  4 |
-- +----+

-- Solution - 1
SELECT a.id
FROM Weather a, Weather b
WHERE datediff(a.recordDate, b.recordDate)=1 AND a.temperature > b.temperature;



-- Solution - 2
SELECT a.id
FROM Weather a
INNER JOIN Weather b
ON datediff(a.recordDate, b.recordDate)=1 
AND a.temperature > b.temperature;