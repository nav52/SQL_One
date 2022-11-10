/* Question */
/* 
Find employees who are earning more than their managers. 
Output the employee's first name along with the corresponding salary.

Table: employee

id:             int
first_name:     varchar
last_name:      varchar
age:            int
sex:            varchar
employee_title: varchar
department:     varchar
salary:         int
target:         int
bonus:          int
email:          varchar
city:           varchar
address:        varchar
manager_id:     int
*/

-- Solution

SELECT DISTINCT emp.first_name, emp.salary
FROM employee emp JOIN employee mgr
ON mgr.id = emp.manager_id
WHERE emp.salary>mgr.salary