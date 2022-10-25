/* Question */
/* 
Find the most profitable company from the financial sector. Output the result along with the continent.

Table: forbes_global_2010_2014

company:        varchar
sector:         varchar
industry:       varchar
continent:      varchar
country:        varchar
marketvalue:    float
sales:          float
profits:        float
assets:         float
rank:           int
forbeswebpage:  varchar

*/

-- Solution

SELECT company, continent
FROM forbes_global_2010_2014
WHERE sector = 'Financials'
ORDER BY profits DESC
LIMIT 1