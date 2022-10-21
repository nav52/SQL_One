/* Question */
/* 
Find the details of each customer regardless of whether the customer made an order. 
Output the customer's first name, last name, and the city along with the order details.
You may have duplicate rows in your results due to a customer ordering several of the same items. 
Sort records based on the customer's first name and the order details in ascending order.

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

SELECT cust.first_name, cust.last_name, cust.city, ord.order_details
FROM customers cust LEFT JOIN orders ord
ON cust.id = ord.cust_id
ORDER BY cust.first_name, ord.order_details