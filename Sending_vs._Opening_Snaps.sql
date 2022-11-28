/* Question */
/* 
Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps. 
Write a query to obtain a breakdown of the time spent sending vs. opening snaps 
(as a percentage of total time spent on these activities) for each age group.

Output the age bucket and percentage of sending and opening snaps. 
Round the percentage to 2 decimal places.
Notes:
    You should calculate these percentages:
        time sending / (time sending + time opening)
        time opening / (time sending + time opening)
    To avoid integer division in percentages, multiply by 100.0 and not 100.

Table: activities

activity_id:    	integer
user_id:        	integer
activity_type:  	string ('send', 'open', 'chat')
time_spent:     	float
activity_date:  	datetime

Table: age_breakdown

user_id:    	integer
age_bucket: 	string ('21-25', '26-30', '31-25')

*/

-- Solution

WITH snaps_stats AS (
    SELECT age_breakdown.age_bucket,
            SUM(CASE WHEN activities.activity_type = 'send'
                THEN activities.time_spent ELSE 0 END) AS send_time,
            SUM(CASE WHEN activities.activity_type = 'open'
                THEN activities.time_spent ELSE 0 END) AS open_time,
            SUM(activities.time_spent) AS total_time
    FROM activities JOIN age_breakdown
    ON activities.user_id = age_breakdown.user_id
    WHERE activities.activity_type IN ('send', 'open')
    GROUP BY age_breakdown.age_bucket)
SELECT age_bucket,
        ROUND((100.0*send_time/total_time),2) AS send_perc,
        ROUND((100.0*open_time/total_time),2) AS open_perc
FROM snaps_stats