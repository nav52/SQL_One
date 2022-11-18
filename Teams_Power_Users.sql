/* Question */
/* 
Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. 
Display the IDs of these 2 users along with the total number of messages they sent. 
Output the results in descending count of the messages.
Assumption:
    No two users has sent the same number of messages in August 2022.

Table: messages

message_id:	    integer
sender_id:	    integer
receiver_id:	integer
content:	    varchar
sent_date:  	datetime

*/

-- Solution

SELECT sender_id, COUNT(content) AS count_messages
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
    AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY count_messages DESC
LIMIT 2;