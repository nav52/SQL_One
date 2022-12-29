/* Question */
/* 
Sometimes, payment transactions are repeated by accident; 
it could be due to user error, API failure or a retry error that causes a credit card to be charged twice.

Using the transactions table, 
    identify any payments made at the same merchant with the same credit card for the same amount within 10 minutes of each other. 
    Count such repeated payments.

Assumptions:
The first transaction of such payments should not be counted as a repeated payment. 
This means, if there are two transactions performed by a merchant with the same credit card and for the same amount within 10 minutes, 
there will only be 1 repeated payment.

Table: transactions

transaction_id:     	integer
merchant_id:        	integer
credit_card_id:     	integer
amount:             	integer
transaction_timestamp:	datetime

*/

-- Solution

WITH payments AS (
    SELECT 
        merchant_id,
        credit_card_id,
        amount,
        EXTRACT(
            EPOCH 
            FROM
                transaction_timestamp - LAG(transaction_timestamp) OVER(
                    PARTITION BY merchant_id, credit_card_id, amount
                    ORDER BY transaction_timestamp)
                )/60 AS minute_difference
    FROM transactions
)
SELECT
    COUNT(merchant_id) AS payment_count
FROM payments
WHERE minute_difference <= 10