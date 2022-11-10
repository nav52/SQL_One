/* Question */
/* 
Find the employee with the highest salary per department.
Output the department name, employee's first name along with the corresponding salary.

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

WITH salary_ranking AS (
    SELECT department, first_name,  salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS 'salary_rank'
    FROM employee)
SELECT department, first_name, salary
FROM salary_ranking
WHERE salary_rank = 1