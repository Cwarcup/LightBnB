-- Show specific details about properties located in Vancouver including their average rating.
-- Select the id, title, cost_per_night, and an average_rating from the properties table for properties located in Vancouver.
-- Order the results from lowest cost_per_night to highest cost_per_night.
-- Limit the number of results to 10.
-- Only show listings that have a rating >= 4 stars.
SELECT
  properties.id,
  properties.title,
  properties.cost_per_night,
  avg(property_reviews.rating) as average_rating
FROM
  properties
  JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE
  city = 'Vancouver'
GROUP BY
  properties.id
HAVING
  avg(property_reviews.rating) >= 4
ORDER BY
  cost_per_night;