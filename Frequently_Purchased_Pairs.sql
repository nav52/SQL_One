/* Question */
/* 
Assume you are given the following tables on Walmart transactions and products. 
Find the number of unique product combinations that are bought together (purchased in the same transaction).

For example, if I find two transactions where apples and bananas are bought, 
and another transaction where bananas and soy milk are bought, 
my output would be 2 to represent the 2 unique combinations. 
Your output should be a single number.

Assumption:
    For each transaction, a maximum of 2 products is purchased.

Table: transactions

transaction_id: 	integer
product_id:     	integer
user_id:        	integer
transaction_date:	datetime

Table: products

product_id: 	integer
product_name:	string

*/

-- Solution

SELECT COUNT(*) AS combo_num
FROM transactions t1 JOIN transactions t2
ON t1.transaction_id = t2.transaction_id AND t1.product_id>t2.product_id