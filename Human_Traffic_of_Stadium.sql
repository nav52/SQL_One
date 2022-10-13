/* Question */
/* 
Write an SQL query to display the records with three or more rows with consecutive id's, 
and the number of people is greater than or equal to 100 for each.
Return the result table ordered by visit_date in ascending order.

Table: Stadium

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| visit_date    | date    |
| people        | int     |
+---------------+---------+
visit_date is the primary key for this table.
Each row of this table contains the visit date and visit id to the stadium with the number of people during the visit.
No two rows will have the same visit_date, and as the id increases, the dates increase as well.
*/

-- Solution

WITH temp_cte AS(
    SELECT *,
        id-ROW_NUMBER() OVER() AS 'id_diff'
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM temp_cte
WHERE id_diff IN
    (SELECT id_diff FROM temp_cte
    GROUP BY id_diff
    HAVING COUNT(*)>2)
ORDER BY visit_date
