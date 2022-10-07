/* Question */
/* 
Write an SQL query to report the IDs of all the employees with missing information. 
The information of an employee is missing if:
    The employee's name is missing, or
    The employee's salary is missing.
Return the result table ordered by employee_id in ascending order.

Table: Employees

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the name of the employee whose ID is employee_id.

Table: Salaries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| salary      | int     |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the salary of the employee whose ID is employee_id.
*/

-- Solution

SELECT T.employee_id
FROM 
    (SELECT * FROM Employees LEFT JOIN Salaries USING(employee_id)
    UNION
    SELECT * FROM Employees RIGHT JOIN Salaries USING(employee_id)) AS T
WHERE T.name is NULL OR T.salary is NULL
ORDER BY T.employee_id