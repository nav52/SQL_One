/* Question */
/* 
Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. 
Output just the absolute difference in salaries.

Table: db_employee

id:             int
first_name:     varchar
last_name:      varchar
salary:         int
department_id:  int

Table: db_dept

id:         int
department: varchar

*/

-- Solution

SELECT 
    ABS((
    SELECT MAX(emp.salary)
    FROM db_employee emp LEFT JOIN db_dept dept
    ON emp.department_id = dept.id
    WHERE dept.department = 'Marketing'
    )-(
    SELECT MAX(emp.salary)
    FROM db_employee emp LEFT JOIN db_dept dept
    ON emp.department_id = dept.id
    WHERE dept.department = 'Engineering'    
    )) AS salary_difference