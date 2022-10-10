/* Question */
/* 
Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, 
the id of the last student is not swapped.
Return the result table ordered by id in ascending order.

Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
*/

-- Solution

SELECT id,
    IFNULL(
        CASE WHEN id%2 !=0 THEN LEAD(student) OVER ()
        ELSE LAG(student) OVER ()
        END, student) AS student
FROM Seat