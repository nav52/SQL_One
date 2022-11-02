/* Question */
/* 
Find the average total compensation based on employee titles and gender. Total compensation is calculated by adding both the salary and bonus of each employee. However, not every employee receives a bonus so disregard employees without bonuses in your calculation. Employee can receive more than one bonus.
Output the employee title, gender (i.e., sex), along with the average total compensation.

Tables: sf_employee

id:             int
first_name:     varchar
last_name:      varchar
age:            int
sex:            varchar
employee_title: varchar
department:     varchar
salary:         int
target:         int
email:          varchar
city:           varchar
address:        varchar
manager_id:     int

Tables: sf_bonus

worker_ref_id:  int
bonus:          int

*/

-- Solution

SELECT emp.employee_title, emp.sex , AVG(emp.salary + sb.bonus) AS avg_TC
FROM sf_employee emp 
JOIN  
    (SELECT worker_ref_id, SUM(bonus) AS bonus
    FROM sf_bonus 
    GROUP BY worker_ref_id) AS sb
ON emp.id = sb.worker_ref_id
GROUP BY 1, 2