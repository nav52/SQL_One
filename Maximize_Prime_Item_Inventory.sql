/* Question */
/* 
Amazon wants to maximize the number of items it can stock in a 500,000 square feet warehouse. 
It wants to stock as many prime items as possible, and afterwards use the remaining square footage to stock the most number of non-prime items.

Write a SQL query to find the number of prime and non-prime items that can be stored in the 500,000 square feet warehouse. 
Output the item type and number of items to be stocked.

Table: inventory

item_id:    	integer
item_type:  	string
item_category:	string
square_footage:	decimal

*/

-- Solution

WITH summary AS (
    SELECT 
        item_type,
        SUM(square_footage) AS total_sqft,
        COUNT(item_id) AS item_count
    FROM inventory
    GROUP BY item_type
),
prime_items AS (
    SELECT
        DISTINCT item_type,
        total_sqft,
        TRUNC(500000/total_sqft, 0) AS prime_item_combo,
        TRUNC(500000/total_sqft, 0)*item_count AS prime_item_count
    FROM summary
    WHERE item_type = 'prime_eligible'
),
non_prime_items AS (
    SELECT
        DISTINCT item_type,
        total_sqft,
        TRUNC((500000 - (SELECT prime_item_combo*total_sqft FROM prime_items))
        / total_sqft, 0) * item_count AS non_prime_item_count
    FROM summary
    WHERE item_type = 'not_prime'
)
SELECT
    item_type,
    prime_item_count AS item_count
FROM prime_items
UNION ALL
SELECT
    item_type,
    non_prime_item_count AS item_count
FROM non_prime_items