/* Question */
/* 
New TikTok users sign up with their emails. 
They confirmed their signup by replying to the text confirmation to activate their accounts. 
Users may receive multiple text messages for account confirmation until they have confirmed their new account.

Write a query to find the activation rate of the users. Round the percentage to 2 decimal places.

Definitions:
    emails table contain the information of user signup details.
    texts table contains the users' activation information.
As of 29 Nov 2022, the term confirmation rate is changed to activation rate to reflect the nature of the new user activation process.

Table: emails

email_id:	    integer
user_id:	    integer
signup_date:	datetime

Table: texts

text_id:    	integer
email_id:   	integer
signup_action:	varchar

*/ 

-- Solution

WITH rate AS (
    SELECT user_id,
            CASE WHEN texts.email_id IS NOT NULL THEN 1 ELSE 0 END AS activation_count
    FROM emails LEFT JOIN texts
    ON emails.email_id = texts.email_id AND texts.signup_action = 'Confirmed'
)
SELECT 
    ROUND(SUM(activation_count)::DECIMAL/ COUNT(user_id),2) AS activation_rate
FROM rate