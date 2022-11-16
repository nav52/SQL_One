/* Question */
/* 
Tesla is investigating bottlenecks in their production, and they need your help to extract the relevant data. 
Write a SQL query that determines which parts have begun the assembly process but are not yet finished.

Assumption
    Table parts_assembly contains all parts in production.

Table: parts_assembly

part:       	string
finish_date:    datetime
assembly_step:	integer

*/

-- Solution

SELECT part 
FROM parts_assembly
WHERE finish_date is NULL
GROUP BY part