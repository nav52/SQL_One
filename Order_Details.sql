/* Question */
/* 
Find order details made by Jill and Eva.
Consider the Jill and Eva as first names of customers.
Output the order date, details and cost along with the first name.
Order records based on the customer id in ascending order.

Table: customers

id:             int
first_name:     varchar
last_name:      varchar
city:           varchar
address:        varchar
phone_number:   varchar

Table: orders

id:                 int
cust_id:            int
order_date:         varchar
order_details:      varchar
total_order_cost:   int

*/

-- Solution

SELECT cust.first_name, ord.order_date, ord.order_details, ord.total_order_cost
FROM customers cust JOIN orders ord
ON cust.id = ord.cust_id
WHERE cust.first_name IN ('Jill','Eva')
ORDER BY ord.cust_id