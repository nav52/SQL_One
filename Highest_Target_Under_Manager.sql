/* Question */
/* 
Find the highest target achieved by the employee or employees who works under the manager id 13. 
Output the first name of the employee and target achieved. 
The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

Table: salesforce_employees

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

SELECT first_name, target
FROM (
    SELECT first_name, target, manager_id, 
            DENSE_RANK() OVER(ORDER BY target DESC) AS 'target_rank'
    FROM salesforce_employees
    WHERE manager_id = 13) subqry
WHERE target_rank=1;