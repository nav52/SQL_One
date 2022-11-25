/* Question */
/* 
UnitedHealth has a program called Advocate4Me, which allows members to call an advocate and 
receive support for their health care needs – 
whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

Write a query to find how many UHG members made 3 or more calls. case_id column uniquely identifies each call made.

Table: callers

policy_holder_id:	integer
case_id:        	varchar
call_category:  	varchar
call_received:  	timestamp
call_duration_secs:	integer
original_order: 	integer
*/

-- Solution

SELECT COUNT(policy_holder_id) AS member_count
FROM (
    SELECT policy_holder_id
    FROM callers  
    GROUP BY policy_holder_id
    HAVING COUNT(case_id) >=3) AS call_records