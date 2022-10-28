/* Question */
/* 
What is the overall friend acceptance rate by date? 
Your output should have the rate of acceptances by the date the request was sent. 
Order by the earliest date to latest.

Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to 
another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. 
If the request is accepted, the table logs action = 'accepted'. 
If the request is not accepted, no record of action = 'accepted' is logged.

Table: fb_friend_requests

user_id_sender:     varchar
user_id_receiver:   varchar
date:               varchar
action:             varchar

*/

-- Solution

WITH count_cte AS (SELECT user_id_sender, user_id_receiver, MIN(date) AS date,
                        SUM(CASE WHEN action='accepted' THEN 1 ELSE 0 END) AS 'accepted_count',
                        SUM(CASE WHEN action='sent' THEN 1 ELSE 0 END) AS 'sent_count'
                    FROM fb_friend_requests
                    GROUP BY user_id_sender, user_id_receiver)
SELECT date, SUM(accepted_count)/SUM(sent_count) AS 'acceptance_rate'
FROM count_cte
GROUP BY date