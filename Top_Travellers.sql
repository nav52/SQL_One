/* Question */
/* 
Write an SQL query to report the distance traveled by each user.
Return the result table ordered by travelled_distance in descending order, 
if two or more users traveled the same distance, order them by their name in ascending order.

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id is the primary key for this table.
name is the name of the user.

Table: Rides

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| user_id       | int     |
| distance      | int     |
+---------------+---------+
id is the primary key for this table.
user_id is the id of the user who traveled the distance "distance".
*/

-- Solution

SELECT u.name, IFNULL(SUM(r.distance),0) as travelled_distance
FROM Users u LEFT JOIN Rides r
ON u.id = r.user_id
GROUP BY u.id
ORDER BY 2 DESC, 1 ASC