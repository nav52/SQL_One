/* Question */
/* 
Find all posts which were reacted to with a heart. 
For such posts output all columns from facebook_posts table.

Tables: facebook_reactions

poster:     int
friend:     int
reaction:   varchar
date_day:   int
post_id:    int

Tables: facebook_posts

post_id:        int
poster:         int
post_text:      varchar
post_keywords:  varchar
post_date:      datetime


*/

-- Solution

SELECT DISTINCT posts.*
FROM facebook_posts posts LEFT JOIN facebook_reactions reactions
ON posts.post_id = reactions.post_id
WHERE reactions.reaction = 'heart'