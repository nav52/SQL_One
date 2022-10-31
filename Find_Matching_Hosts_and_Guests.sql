/* Question */
/* 
Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.

Tables: airbnb_hosts

host_id:        int
nationality:    varchar
gender:         varchar
age:            int

Tables: airbnb_guests

guest_id:       int
nationality:    varchar
gender:         varchar
age:            int
*/

-- Solution

SELECT DISTINCT hosts.host_id, guests.guest_id
FROM airbnb_hosts hosts JOIN airbnb_guests guests
ON hosts.nationality = guests.nationality AND hosts.gender = guests.gender;