/* Question */
/* 
Assume you are given the tables below about Facebook pages and page likes. 
Write a query to return the page IDs of all the Facebook pages that don't have any likes. 
The output should be in ascending order.

Table: pages 

page_id:	integer
name:   	varchar

Table: page_likes

user_id:	integer
page_id:	integer
liked_date:	datetime

*/

-- Solution

SELECT pages.page_id
FROM pages LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id
WHERE liked_date is NULL
ORDER BY 1
