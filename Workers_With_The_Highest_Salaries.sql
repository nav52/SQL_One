/* Question */
/* 
Find the titles of workers that earn the highest salary. 
Output the highest-paid title or multiple titles that share the highest salary.

Tables: worker

worker_id:      int
first_name:     varchar
last_name:      varchar
salary:         int
joining_date:   datetime
department:     varchar

Table: title

worker_ref_id:  int
worker_title:   varchar
affected_from:  varchar

*/

-- Solution

SELECT title.worker_title as 'best_paid_title'
FROM worker LEFT JOIN title
ON worker.worker_id = title.worker_ref_id
WHERE salary = (SELECT MAX(salary) FROM worker);