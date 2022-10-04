/* Question */
/* 
Write an SQL query to find all numbers that appear at least three times consecutively.
Return the result table in any order.

Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.
id is an autoincrement column.
*/

-- Solution

SELECT DISTINCT l1.num as 'ConsecutiveNums'
FROM Logs l1
INNER JOIN Logs l2 ON l2.id = l1.id+1 AND l1.num=l2.num
INNER JOIN Logs l3 ON l3.id = l1.id+2 AND l1.num=l3.num