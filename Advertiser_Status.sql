/* Question */
/* 
Write a query to update the Facebook advertiser's status using the daily_pay table. 
Advertiser is a two-column table containing the user id and their payment status based on the last payment 
and daily_pay table has current information about their payment. 
Only advertisers who paid will show up in this table.

Output the user id and current payment status sorted by the user id.

Table: advertiser

user_id:	string
status: 	string

Table: daiy_pay

user_id:	string
paid: 	    decimal

Definition of advertiser status:

New:        newly registered users who made their first payment.
Existing:   users who paid previously and recently made a current payment.
Churn:      users who paid previously, but have yet to make any recent payment.
Resurrect:  users who did not pay recently but may have made a previous payment and have made payment again recently.

For better understanding of the advertiser's status, we're sharing with you a table of possible transitions based on the payment status.

#	Start	    End	        Condition
1	NEW	        EXISTING	Paid on day T
2	NEW	        CHURN	    No pay on day T
3	EXISTING	EXISTING	Paid on day T
4	EXISTING	CHURN       No pay on day T
5	CHURN	    RESURRECT	Paid on day T
6	CHURN	    CHURN	    No pay on day T
7	RESURRECT	EXISTING	Paid on day T
8	RESURRECT	CHURN	    No pay on day T

Row 2, 4, 6, 8: As long as the user has not paid on day T, the end status is updated to CHURN regardless of the previous status.
Row 1, 3, 5, 7: When the user paid on day T, the end status is updated to either EXISTING or RESURRECT, depending on their previous state. 
                RESURRECT is only possible when the previous state is CHURN. 
                When the previous state is anything else, the status is updated to EXISTING.

*/

-- Solution

WITH user_payment AS (
    SELECT advertiser.user_id, advertiser.status, daily_pay.paid 
    FROM advertiser LEFT JOIN daily_pay
    ON advertiser.user_id = daily_pay.user_id
    UNION
    SELECT daily_pay.user_id, advertiser.status, daily_pay.paid
    FROM daily_pay LEFT JOIN advertiser
    ON daily_pay.user_id = advertiser.user_id
)
SELECT 
    user_id,
    CASE WHEN paid IS NULL THEN 'CHURN'
        WHEN status != 'CHURN' AND paid IS NOT NULL THEN 'EXISTING'
        WHEN status = 'CHURN' AND paid IS NOT NULL THEN 'RESURRECT'
        WHEN status IS NULL THEN 'NEW'
    END AS new_status
FROM user_payment
ORDER BY user_id