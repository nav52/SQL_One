/* Question */
/* 
Assume you have the table below containing information on Facebook user actions. 
Write a query to obtain the active user retention in July 2022. Output the month (in numerical format 1, 2, 3) 
and the number of monthly active users (MAUs).

Hint: An active user is a user who has user action ("sign-in", "like", or "comment") in the current month and last month.

Table: user_actions 

user_id:	integer
event_id:	integer
event_type:	string ("sign-in, "like", "comment")
event_date:	datetime

*/

-- Solution

SELECT 
    EXTRACT(MONTH FROM curr_month.event_date) AS mth,
    COUNT(DISTINCT curr_month.user_id) AS monthly_active_users
FROM user_actions AS curr_month
WHERE EXISTS (
    SELECT last_month.user_id
    FROM user_actions AS last_month
    WHERE last_month.user_id = curr_month.user_id
        AND EXTRACT(MONTH FROM last_month.event_date) =
            EXTRACT(MONTH FROM curr_month.event_date - interval '1 month')
)
    AND EXTRACT(MONTH FROM curr_month.event_date) = 7
    AND EXTRACT(YEAR FROM curr_month.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM curr_month.event_date)