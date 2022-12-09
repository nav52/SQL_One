/* Question */
/* 
You are trying to find the most common (aka the mode) number of items bought per order on Alibaba.

However, instead of doing analytics on all Alibaba orders, you have access to a summary table, 
which describes how many items were in an order (item_count), and the number of orders that had that many items (order_occurrences).

In case of multiple item counts, display the item_counts in ascending order.

Table: items_per_order

item_count:     	integer
order_occurrences:	integer

*/

-- Solution

SELECT item_count
FROM (
        SELECT item_count, 
                RANK() OVER (ORDER BY order_occurrences DESC) as order_rank
        FROM items_per_order) AS orders
WHERE order_rank = 1
ORDER BY item_count