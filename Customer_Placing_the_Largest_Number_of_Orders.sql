/* Question */
/* 
Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.
Assume that exactly one customer will have placed more orders than any other customer.

Table: Orders

+-----------------+----------+
| Column Name     | Type     |
+-----------------+----------+
| order_number    | int      |
| customer_number | int      |
+-----------------+----------+
order_number is the primary key for this table.
This table contains information about the order ID and the customer ID.
*/

-- Solution

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1
