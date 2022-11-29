/* Question */
/* 
Assume you are given the table containing information on Amazon customers and their spending on products in various categories.
Identify the top two highest-grossing products within each category in 2022. 
Output the category, product, and total spend.

Table: product_spend

category:	        string
product:	        string
user_id:	        integer
spend:  	        decimal
transaction_date:  	timestamp

*/

-- Solution

WITH product_cat_spend AS (
    SELECT category, product, SUM(spend) AS total_spend
    FROM product_spend
    WHERE transaction_date >= '01-01-2022' AND transaction_date < '01-01-2023'
    GROUP BY category, product
),
top_spend AS (
    SELECT *, RANK()OVER(PARTITION BY category ORDER BY total_spend DESC) AS spend_rank
    FROM product_cat_spend
)
SELECT category, product, total_spend
FROM top_spend
WHERE spend_rank <= 2
ORDER BY category, spend_rank