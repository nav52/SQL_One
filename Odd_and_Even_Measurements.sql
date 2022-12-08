/* Question */
/* 
Assume you are given the table containing measurement values obtained from a Google sensor over several days. 
Measurements are taken several times within a given day.

Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a particular day, in two different columns. 
Refer to the Example Output below for the output format.

Definition:

1st, 3rd, and 5th measurements taken within a day are considered odd-numbered measurements 
and the 2nd, 4th, and 6th measurements are even-numbered measurements.

Table: measurements

measurement_id: 	integer
measurement_value:	decimal
measurement_time:	datetime

*/

-- Solution 

WITH measurements_serial AS
(SELECT 
        CAST(measurement_time AS DATE) AS measurement_day,
        measurement_id,
        measurement_value,
        ROW_NUMBER() OVER(PARTITION BY CAST(measurement_time AS DATE) ORDER BY measurement_time) AS measurement_num
FROM measurements)
SELECT measurement_day,
        SUM(CASE WHEN measurement_num%2=0 THEN measurement_value ELSE 0 END) AS even_sum,
        SUM(CASE WHEN measurement_num%2<>0 THEN measurement_value ELSE 0 END) AS odd_sum
FROM measurements_serial
GROUP BY measurement_day