/* Question */
/* 
Count the number of movies that Abigail Breslin was nominated for an oscar.

Table: oscar_nominees

year:       int
category:   varchar
nominee:    varchar
movie:      varchar
winner:     bool
id:         int

*/

-- Solution

SELECT COUNT(movie) as 'n_movies_by_abi'
FROM oscar_nominees
WHERE nominee = 'Abigail Breslin'