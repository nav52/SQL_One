/* Question */
/* 
Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.

Tables: airbnb_hosts

host_id:        int
nationality:    varchar
gender:         varchar
age:            int

Tables: airbnb_units

host_id:        int
unit_id:        varchar
unit_type:      varchar
n_beds:         int
n_bedrooms:     int
country:        varchar
city:           varchar
*/

-- Solution

SELECT hosts.nationality, COUNT(DISTINCT units.unit_id) AS 'number_of_apartments'
FROM airbnb_hosts hosts JOIN airbnb_units units
ON hosts.host_id = units.host_id
WHERE units.unit_type = 'Apartment' AND hosts.age < 30
GROUP BY hosts.nationality 