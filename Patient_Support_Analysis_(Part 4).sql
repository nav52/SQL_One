/* Question */
/* 
UnitedHealth Group has a program called Advocate4Me, 
which allows members to call an advocate and receive support for their health care needs 
– whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

A long-call is categorised as any call that lasts more than 5 minutes (300 seconds). 
What's the month-over-month growth of long-calls?

Output the year, month (both in numerical and chronological order) and growth percentage rounded to 1 decimal place.

Table: callers

policy_holder_id:	integer
case_id:        	varchar
call_category:  	varchar
call_received:  	timestamp
call_duration_secs:	integer
original_order: 	integer

*/

-- Solution

WITH long_calls AS (
SELECT 
    EXTRACT(YEAR FROM call_received) AS year,
    EXTRACT(MONTH FROM call_received) AS month,
    COUNT(case_id) AS current_month_call,
    LAG(COUNT(case_id)) OVER(ORDER BY EXTRACT(MONTH FROM call_received)) AS prev_month_call
FROM callers
WHERE call_duration_secs > 300
GROUP BY 
    EXTRACT(YEAR FROM call_received),
    EXTRACT(MONTH FROM call_received)
)
SELECT 
year, month,
ROUND(100.0 *
    (current_month_call-prev_month_call)/prev_month_call,
    1) AS growth_pct
FROM long_calls
ORDER BY year, month