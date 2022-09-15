/* Question */
/* 
Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.

Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the primary key for this table.
This table contains information about the temperature on a certain day.
*/

-- Solution

WITH weather_cte as (SELECT id,
    temperature-LAG(temperature,1) OVER (ORDER BY recordDate) as temp_diff,
    DATEDIFF(recordDate, LAG(recordDate,1) OVER (ORDER BY recordDate)) as date_diff
FROM Weather)
SELECT id FROM weather_cte
WHERE temp_diff>0 AND date_diff=1
