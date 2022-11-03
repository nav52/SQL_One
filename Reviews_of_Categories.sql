/* Question */
/* 
Find the top business categories based on the total number of reviews. 
Output the category along with the total number of reviews. 
Order by total reviews in descending order.

Table: yelp_business

business_id:    varchar
name:           varchar
neighborhood:   varchar
address:        varchar
city:           varchar
state:          varchar
postal_code:    varchar
latitude:       float
longitude:      float
stars:          float
review_count:   int
is_open:        int
categories:     varchar

*/

-- Solution

-- Categories are separated by ';'. We need to add count for each category in the review
WITH RECURSIVE num (n) AS (
    SELECT 1
    UNION ALL
    SELECT n+1 FROM num WHERE n<12
)
SELECT 
    SUBSTRING_INDEX(SUBSTRING_INDEX(categories, ';', n), ';', -1) AS 'category',
    SUM(review_count) AS 'total'
FROM yelp_business JOIN num
ON n <= CHAR_LENGTH(categories) - CHAR_LENGTH(replace(categories, ';',''))+1
GROUP BY 1