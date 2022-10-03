/* Question */
/* 
Write an SQL query to report the nth highest salary from the Employee table. 
If there is no nth highest salary, the query should report null.

Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
*/

-- Solution

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    RETURN (
        SELECT IFNULL(e.salary,NULL)
        FROM (SELECT salary,
                    DENSE_RANK() OVER (ORDER BY salary DESC) AS 'rank'
            FROM Employee
            ) AS e
        WHERE e.rank = N
        LIMIT 1
        );
END