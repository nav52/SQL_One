/* Question */
/* 
You're given two tables on Spotify users' streaming data. 
songs_history table contains the historical streaming data and songs_weekly table contains the current week's streaming data.

Write a query to output the user id, song id, and cumulative count of song plays as of 4 August 2022 sorted in descending order.

Definitions:

    song_weekly table currently holds data from 1 August 2022 to 7 August 2022.
    songs_history table currently holds data up to to 31 July 2022. The output should include the historical data in this table.

Assumption:
    There may be a new user or song in the songs_weekly table not present in the songs_history table.

Table: songs_history

history_id:	integer
user_id:	integer
song_id:	integer
song_plays:	integer

Table: songs_weekly

user_id:	    integer
song_id:	    integer
listen_time:	datetime
*/

-- Solution

WITH songs AS (
    SELECT user_id, song_id, song_plays
    FROM songs_history
    UNION ALL
    SELECT user_id, song_id, 
            COUNT(song_id) AS song_plays
    FROM songs_weekly
    WHERE listen_time <= '08/04/2022 23:59:59'
    GROUP BY user_id, song_id)
SELECT user_id, song_id, SUM(song_plays) AS song_count
FROM songs
GROUP BY user_id, song_id
ORDER BY song_count DESC