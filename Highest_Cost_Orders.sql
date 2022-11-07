/* Question */
/* 
Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. 
If customer had more than one order on a certain day, sum the order costs on daily basis. 
Output customer's first name, total cost of their items, and the date.
For simplicity, you can assume that every first name in the dataset is unique.

Tables: customers

id:             int
first_name:     varchar
last_name:      varchar
city:           varchar
address:        varchar
phone_number:   varchar

Tables: orders

id:                 int
cust_id:            int
order_date:         datetime
order_details:      varchar
total_order_cost:   int
*/

-- Solution

SELECT cust.first_name, SUM(ord.total_order_cost) AS 'cost', ord.order_date
FROM customers cust LEFT JOIN orders ord
ON cust.id=ord.cust_id
WHERE ord.order_date > '2019-02-01' AND ord.order_date < '2019-05-01'
GROUP BY ord.cust_id, ord.order_date
ORDER BY 'cost' DESC
LIMIT 1;