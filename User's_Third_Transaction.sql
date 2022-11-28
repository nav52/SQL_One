/* Question */
/* 
Assume you are given the table below on Uber transactions made by users. 
Write a query to obtain the third transaction of every user. 
Output the user id, spend and transaction date.

Table: transactions

user_id:        	integer
spend:          	decimal
transaction_date:	timestamp

*/

-- Solution

SELECT user_id, spend, transaction_date
FROM (
    SELECT user_id, spend, transaction_date,
        RANK()OVER(PARTITION BY user_id ORDER BY transaction_date) AS spend_index
    FROM transactions
) AS spend_ranker
WHERE spend_index = 3

