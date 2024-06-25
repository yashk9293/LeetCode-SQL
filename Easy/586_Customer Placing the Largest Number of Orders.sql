-- Question Link :- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
-- Customer Placing the Largest Number of Orders


-- Query the customer_number from the orders table for the customer who has placed the largest number of orders.

-- It is guaranteed that exactly one customer will have placed more orders than any other customer.

-- The orders table is defined as follows:

-- | Column            | Type      |
-- |-------------------|-----------|
-- | order_number (PK) | int       |
-- | customer_number   | int       |
-- | order_date        | date      |
-- | required_date     | date      |
-- | shipped_date      | date      |
-- | status            | char(15)  |
-- | comment           | char(200) |
-- Sample Input

-- | order_number | customer_number | order_date | required_date | shipped_date | status | comment |
-- |--------------|-----------------|------------|---------------|--------------|--------|---------|
-- | 1            | 1               | 2017-04-09 | 2017-04-13    | 2017-04-12   | Closed |         |
-- | 2            | 2               | 2017-04-15 | 2017-04-20    | 2017-04-18   | Closed |         |
-- | 3            | 3               | 2017-04-16 | 2017-04-25    | 2017-04-20   | Closed |         |
-- | 4            | 3               | 2017-04-18 | 2017-04-28    | 2017-04-25   | Closed |         |
-- Sample Output

-- | customer_number |
-- |-----------------|
-- | 3               |
-- Explanation

-- The customer with number '3' has two orders, 
-- which is greater than either customer '1' or '2' because each of them  only has one order. 
-- So the result is customer_number '3'.


-- Solution
-- Ranking them according to the number of orders to have same rank for 
-- customers with same number of orders
SELECT customer_number FROM Orders 
GROUP BY customer_number 
ORDER BY count(customer_number) desc 
limit 1;



-- Explanation:
-- First we need to select customer_number from Orders
-- Then we need to group by the same column i.e customer_number 
-- After that count the occurences of values in customer_number and then with the help of desc (descending) keyword I have converted it into descending order
-- In the end I have used limit 1 so that only the max occurring element is shown in the output table