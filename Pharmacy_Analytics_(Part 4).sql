/* Question */
/* 
CVS Health is trying to better understand its pharmacy sales, and how well different drugs are selling.

Write a query to find the top 2 drugs sold, in terms of units sold, for each manufacturer. List your results in alphabetical order by manufacturer.

Table: pharmacy_sales

product_id: 	integer
units_sold: 	integer
total_sales:   	decimal
cogs:       	decimal
manufacturer:	varchar
drug:       	varchar

*/

-- Solution

SELECT manufacturer, drug
FROM 
    (SELECT manufacturer, drug, units_sold,
        RANK() OVER(PARTITION BY manufacturer ORDER BY units_sold DESC) AS sales_ranking
    FROM pharmacy_sales
    ORDER BY manufacturer, units_sold DESC) AS sales_rank
WHERE sales_ranking <= 2