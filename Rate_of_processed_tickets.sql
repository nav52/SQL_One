/* Question */
/* 
Find the rate of processed tickets for each type.

Table: facebook_complaint

complaint_id:   int
type:           int
processed:      bool
*/

-- Solution

SELECT type,
    SUM(processed)/COUNT(*) AS 'rate_of_processed'
FROM facebook_complaints
GROUP BY type