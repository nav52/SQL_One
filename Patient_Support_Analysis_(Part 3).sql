/* Question */
/* 
UnitedHealth Group has a program called Advocate4Me, 
which allows members to call an advocate and receive support for their health care needs 
– whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

Write a query to get the patients who made a call within 7 days of their previous call. 
If a patient called more than twice in a span of 7 days, count them as once.

Table: callers

policy_holder_id:	integer
case_id:        	varchar
call_category:  	varchar
call_received:  	timestamp
call_duration_secs:	integer
original_order: 	integer

*/

-- Solution

WITH call_history AS (
SELECT 
    policy_holder_id,
    call_received AS current_call,
    LAG(call_received) OVER(
        PARTITION BY policy_holder_id
        ORDER BY call_received) AS previous_call,
    EXTRACT(EPOCH FROM call_received - 
            LAG(call_received) OVER(
            PARTITION BY policy_holder_id
            ORDER BY call_received))/(24*60*60) AS day_difference
FROM callers
)
SELECT COUNT(DISTINCT policy_holder_id) AS patient_count
FROM call_history
WHERE day_difference <= 7