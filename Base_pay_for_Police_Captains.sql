/* Question */
/* 
Find the base pay for Police Captains.
Output the employee name along with the corresponding base pay.

Table: sf_public_salaries

id:                 int
employeename:       varchar
jobtitle:           varchar
basepay:            float
overtimepay:        float
otherpay:           float
benefits:           float
totalpay:           float
totalpaybenefits:   float
year:               int
notes:              datetime
agency:             varchar
status:             varchar

*/

-- Solution

SELECT employeename, basepay
FROM sf_public_salaries
WHERE jobtitle LIKE '%captain%'