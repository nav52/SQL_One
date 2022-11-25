/* Question */
/* 
UnitedHealth Group has a program called Advocate4Me, which allows members to call an advocate and 
receive support for their health care needs – 
whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

Calls to the Advocate4Me call centre are categorised, but sometimes they can't fit neatly into a category. 
These uncategorised calls are labelled “n/a”, or are just empty (when a support agent enters nothing into the category field).

Write a query to find the percentage of calls that cannot be categorised. Round your answer to 1 decimal place.

Table: callers

policy_holder_id:	integer
case_id:        	varchar
call_category:  	varchar
call_received:  	timestamp
call_duration_secs:	integer
original_order: 	integer
*/

-- Solution

SELECT 
    ROUND(100.0* COUNT(case_id)/
    (SELECT COUNT(*) FROM callers)
    ,1) AS uncategorized_call_pct 
FROM callers
WHERE call_category = 'n/a' OR call_category IS NULL;