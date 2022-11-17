/* Question */
/* 
Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. 
Write a query to get the number of companies that have posted duplicate job listings.
Clarification:
Duplicate job listings refer to two jobs at the same company with the same title and description.

Table: job_listings

job_id: 	    integer
company_id:	    integer
title:  	    string
description:	string

*/

-- Solution

WITH grouped_jobs AS (
    SELECT company_id, title, description,
        COUNT(DISTINCT job_id) AS count_jobs
    FROM job_listings
    GROUP BY company_id, title, description
)
SELECT COUNT(DISTINCT company_id) AS co_w_duplicate_jobs
FROM grouped_jobs
WHERE count_jobs > 1