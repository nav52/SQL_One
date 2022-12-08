/* Question */
/* 
Assume you are given the table on Walmart user transactions. 
Based on a user's most recent transaction date, write a query to obtain the users and the number of products bought.

Output the user's most recent transaction date, user ID and the number of products sorted by the transaction date in chronological order.

Table: user_transactions

product_id:	        integer
user_id:    	    integer
spend:          	decimal
transaction_date:	timestamp

*/

-- Solution

WITH latest_transaction AS (
SELECT transaction_date, user_id, product_id,
        RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS days_rank
FROM user_transactions)

SELECT transaction_date, user_id, COUNT(product_id) AS product_count
FROM latest_transaction
WHERE days_rank = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date