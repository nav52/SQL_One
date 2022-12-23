/* Question */
/* 
You are trying to find the median number of items bought per order on Alibaba, rounded to 1 decimal point.

However, instead of doing analytics on all Alibaba orders, you have access to a summary table, 
which describes how many items were in an order, and the number of orders that had that many items.

Table: items_per_order 

item_count:     	integer
order_occurrences:	integer

*/

-- Solution

WITH summary_series AS (
    SELECT item_count
    FROM items_per_order
    GROUP BY item_count, GENERATE_SERIES(1, order_occurrences)
)
SELECT ROUND(
        PERCENTILE_CONT(0.50) WITHIN GROUP(ORDER BY item_count)::DECIMAL,
        1
    ) AS median
FROM summary_series