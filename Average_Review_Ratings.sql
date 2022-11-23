/* Question */
/* 
Given the reviews table, write a query to get the average stars for each product every month.

The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. 
Sort the output based on month followed by the product id.

Table: reviews

review_id:	    integer
user_id:	    integer
submit_date:	datetime
product_id:	    integer
stars:  	    integer (1-5)

*/

-- Solution

SELECT EXTRACT(MONTH FROM submit_date) AS month,
        product_id,
        ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY month, product_id
ORDER BY month, product_id;