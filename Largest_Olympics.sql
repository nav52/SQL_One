/* Question */
/* 
Find the Olympics with the highest number of athletes. 
The Olympics game is a combination of the year and the season, and is found in the 'games' column. 
Output the Olympics along with the corresponding number of athletes.

Table: olympics_athletes_events

id:         int
name:       varchar
sex:        varchar
age:        float
height:     float
weight:     datetime
team:       varchar
noc:        varchar
games:      varchar
year:       int
season:     varchar
city:       varchar
sport:      varchar
event:      varchar
medal:      varchar

*/

-- Solution

SELECT games AS 'Olympics', COUNT(DISTINCT id) AS 'number_of_athletes'
FROM olympics_athletes_events
GROUP BY games
ORDER BY 2 DESC
LIMIT 1