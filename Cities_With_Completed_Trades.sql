/* Question */
/* 
You are given the tables below containing information on Robinhood trades and users. 
Write a query to list the top three cities that have the most completed trade orders in descending order.

Output the city and number of orders.

Table: trades

order_id:	integer
user_id:	integer
price:  	decimal
quantity:	integer
status: 	string('Completed' ,'Cancelled')
timestamp:	datetime

Table: users

user_id:	    integer
city:   	    string
email:  	    string
signup_date:    datetime

*/

-- Solution

SELECT users.city, COUNT(*) AS total_orders
FROM trades JOIN users
ON trades.user_id = users.user_id
WHERE trades.status = 'Completed'
GROUP BY users.city
ORDER BY total_orders DESC
LIMIT 3;