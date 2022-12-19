/* Question */
/* 
A phone call is considered an international call when the person calling is in a different country than the person receiving the call.
What percentage of phone calls are international? Round the result to 1 decimal.
Assumption:
    The caller_id in phone_info table refers to both the caller and receiver.

Table: phone_calls

caller_id:  	integer
receiver_id:	integer
call_time:  	timestamp

Table: phone_info

caller_id:  	integer
country_id: 	integer
network:    	integer
phone_number:	string

*/

-- Solution

SELECT 
    ROUND(
        100.0* SUM(CASE
            WHEN caller.country_id <> receiver.country_id THEN 1 ELSE NULL END)
        /COUNT(*) , 1) AS international_call_pct
FROM phone_calls AS calls LEFT JOIN phone_info AS caller
ON calls.caller_id = caller.caller_id
LEFT JOIN phone_info AS receiver
ON calls.receiver_id = receiver.caller_id