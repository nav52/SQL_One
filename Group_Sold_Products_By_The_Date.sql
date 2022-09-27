/* Question */
/* 
Write an SQL query to find for each date the number of different products sold and their names.
The sold products names for each date should be sorted lexicographically.
Return the result table ordered by sell_date.

Table Activities:

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
There is no primary key for this table, it may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.
*/

-- Solution

SELECT sell_date,
    COUNT(DISTINCT product) as 'num_sold',
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC) as 'products'
FROM Activities
GROUP BY 1
