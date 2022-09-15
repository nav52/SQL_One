/* Question */
/* 
Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
*/

-- Solution

SELECT name 
FROM Customer
WHERE COALESCE(referee_id,0) <> 2

/* COALESCE is needed to fill up the NULL values in referee_id column */
