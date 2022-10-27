/* Question */
/* 
Write a query that'll identify returning active users. 
A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. 
Output a list of user_ids of these returning active users.

Table: amazon_transactions

id:         int
user_id:    int
item:       varchar
created_at: varchar
revenue:    int

*/

-- Solution

SELECT DISTINCT user_id 
FROM (SELECT *, 
    LEAD(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS 'next_purchase'
    FROM amazon_transactions) transact_query
WHERE DATEDIFF(next_purchase,created_at) <= 7;