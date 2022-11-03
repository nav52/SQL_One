/* Question */
/* 
Find the review_text that received the highest number of  'cool' votes.
Output the business name along with the review text with the highest numbef of 'cool' votes.

Table: yelp_reviews

business_name:  varchar
review_id:      varchar
user_id:        varchar
stars:          varchar
review_date:    datetime
review_text:    varchar
funny:          int
useful:         int
cool:           int

*/

-- Solution

WITH aggregate_cte AS (
    SELECT business_name, review_text, SUM(cool) AS 'cool_votes'
    FROM yelp_reviews
    GROUP BY review_text
    ORDER BY cool_votes DESC)
SELECT business_name, review_text, cool_votes
FROM aggregate_cte
WHERE cool_votes = (SELECT MAX(cool_votes) FROM aggregate_cte)
