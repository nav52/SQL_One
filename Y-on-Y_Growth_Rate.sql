/* Question */
/* 
Assume you are given the table below containing information on user transactions for particular products. 
Write a query to obtain the year-on-year growth rate for the total spend of each product for each year.

Output the year (in ascending order) partitioned by product id, current year's spend, previous year's spend 
and year-on-year growth rate (percentage rounded to 2 decimal places).

Table: user_transactions

transaction_id: 	integer
product_id: 	    integer
spend:      	    decimal
transaction_date:   datetime

*/

-- Solution

WITH yearly_spend AS (
    SELECT 
        EXTRACT(YEAR FROM transaction_date) AS year,
        product_id,
        SUM(spend) AS curr_year_spend
    FROM user_transactions
    GROUP BY product_id, year
),
yearly_variance AS (
    SELECT *,
        LAG(curr_year_spend, 1) OVER (PARTITION BY product_id ORDER BY product_id, year) AS prev_year_spend
    FROM yearly_spend
)
SELECT
    year, product_id, curr_year_spend, prev_year_spend,
    ROUND(100*(curr_year_spend-prev_year_spend)/prev_year_spend, 2) AS yoy_growth_rate
FROM yearly_variance