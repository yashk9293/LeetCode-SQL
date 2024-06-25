-- Question Link :- https://leetcode.com/problems/customers-who-never-order/
-- Customers Who Never Order


-- Suppose that a website contains two tables, 
-- the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

-- Table: Customers.
-- +----+-------+
-- | Id | Name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+


-- Table: Orders.
-- +----+------------+
-- | Id | CustomerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+
-- Using the above tables as example, return the following:

-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+


-- Solution - 1
SELECT name as Customers 
FROM Customers
WHERE id NOT IN (SELECT CustomerId FROM Orders);






-- On doing LEFT JOIN, the table becomes

-- +----+-------+------+------------+
-- | id | name  | id   | customerId |
-- +----+-------+------+------------+
-- | 1  | Joe   | 2    | 1          |
-- | 2  | Henry | null | null       |
-- | 3  | Sam   | 1    | 3          |
-- | 4  | Max   | null | null       |
-- +----+-------+------+------------+

-- Solution - 2
SELECT name as Customers
FROM Customers
LEFT JOIN Orders
ON Customers.id = Orders.customerId
WHERE Orders.customerId IS NULL;

