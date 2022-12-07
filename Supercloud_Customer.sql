/* Question */
/* 
A Microsoft Azure Supercloud customer is a company which buys at least 1 product from each product category.
Write a query to report the company ID which is a Supercloud customer.

Table: customer_contracts

customer_id:	integer
product_id:	    integer
amount: 	    integer

Table: products

product_id:     	integer
product_category:	string
product_name:   	string

*/

-- Solution

WITH supercloud AS (
        SELECT customers.customer_id, 
                COUNT(DISTINCT products.product_category) AS unique_products_count
        FROM customer_contracts customers LEFT JOIN products
        ON customers.product_id = products.product_id
        GROUP BY customers.customer_id
)
SELECT customer_id
FROM supercloud
WHERE unique_products_count = (
            SELECT COUNT(DISTINCT product_category)
            FROM products
)
ORDER BY customer_id