/* Question */
/* 
Find the date with the highest total energy consumption from the Meta/Facebook data centers. Output the date along with the total energy consumption across all data centers.

Tables: fb_eu_energy 

date:           datetime
consumption:    int

Tables: fb_asia_energy

date:           datetime
consumption:    int

Tables: fb_na_energy

date:           datetime
consumption:    int

*/

-- Solution

WITH all_dc AS (
    SELECT date, consumption FROM fb_eu_energy
    UNION ALL
    SELECT date, consumption FROM fb_asia_energy
    UNION ALL
    SELECT date, consumption FROM fb_na_energy
),
total_consumption AS (
    SELECT date, SUM(consumption) AS total_energy
    FROM all_dc
    GROUP BY date
)
SELECT date, total_energy
FROM total_consumption
WHERE total_energy = (
            SELECT MAX(total_energy) FROM total_consumption
)