/* Question */
/* 
Classify each business as either a restaurant, cafe, school, or other. 
A restaurant should have the word 'restaurant' in the business name. 
For cafes, either 'cafe', 'café', or 'coffee' can be in the business name. 
'School' should be in the business name for schools. 
All other businesses should be classified as 'other'. 
Output the business name and the calculated classification.

Table: sf_restaurant_health_violations

business_id:            int
business_name:          varchar
business_address:       varchar
business_city:          varchar
business_state:         varchar
business_postal_code:   float
business_latitude:      float
business_longitude:     float
business_location:      varchar
business_phone_number:  float
inspection_id:          varchar
inspection_date:        datetime
inspection_score:       float
inspection_type:        varchar
violation_id:           varchar
violation_description:  varchar
risk_category:          varchar

*/

-- Solution

SELECT DISTINCT business_name,
    CASE
        WHEN business_name LIKE '%restaurant%' THEN 'restaurant'
        WHEN business_name LIKE '%School%' THEN 'school'
        WHEN business_name LIKE '%cafe%' OR business_name LIKE '%coffee%' OR business_name LIKE '%café%' THEN 'cafe'
        ELSE 'other'
    END AS 'business_type'
FROM sf_restaurant_health_violations;