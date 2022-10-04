/* Question */
/* 
Write an SQL query to find employees who have the highest salary in each of the departments.
Return the result table in any order.

Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key column for this table.
departmentId is a foreign key of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID of a department and its name.
*/

-- Solution

SELECT d.name AS 'Department',
    e.name AS 'Employee',
    e.salary AS 'Salary'
FROM Employee e LEFT JOIN Department d
ON e.departmentId = d.id
WHERE (e.departmentId,salary) IN 
    (SELECT departmentId, MAX(salary)
    FROM Employee
    GROUP BY departmentId)