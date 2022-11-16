/* Question */
/* 
Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). 
Define “mobile” as the sum of tablet and phone viewership numbers. 
Write a query to compare the viewership on laptops versus mobile devices.
Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".

Table: viewership

user_id:    	integer
device_type:    string ('laptop', 'tablet', 'phone')
view_time:  	timestamp

*/

-- Solution

SELECT 
  COUNT(CASE WHEN device_type = 'laptop' THEN 1 ELSE NULL END) AS laptop_views,
  COUNT(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE NULL END) AS mobile_views
FROM viewership;