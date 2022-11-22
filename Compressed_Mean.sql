/* Question */
/* 
You are trying to find the mean number of items bought per order on Alibaba, rounded to 1 decimal place.

However, instead of doing analytics on all Alibaba orders, you have access to a summary table, 
    which describes how many items were in an order (item_count), and the number of orders that had that many items (order_occurrences).

Table: items_per_order

item_count:	        integer
order_occurrences:	integer

*/

-- Solution

SELECT 
    ROUND( SUM(item_count::DECIMAL*order_occurrences)/SUM(order_occurrences), 1) as mean
FROM items_per_order;