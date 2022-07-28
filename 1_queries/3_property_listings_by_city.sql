-- Show specific details about properties located in Vancouver including their average rating.
-- Select the id, title, cost_per_night, and an average_rating from the properties table for properties located in Vancouver.
-- Order the results from lowest cost_per_night to highest cost_per_night.
-- Limit the number of results to 10.
-- Only show listings that have a rating >= 4 stars.
-- SELECT
--   properties.id,
--   properties.title,
--   properties.cost_per_night,
--   avg(property_reviews.rating) as average_rating
-- FROM
--   properties
--   JOIN property_reviews ON properties.id = property_reviews.property_id
-- WHERE
--   city = 'Vancouver'
-- GROUP BY
--   properties.id
-- HAVING
--   avg(property_reviews.rating) >= 4
-- ORDER BY
--   cost_per_night;
---
SELECT
  properties.*,
  avg(property_reviews.rating) as average_rating
FROM
  properties
  JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE
  properties.owner_id = 1
GROUP BY
  properties.id
ORDER BY
  cost_per_night
LIMIT
  1;

SELECT
  properties.*,
  avg(property_reviews.rating) as average_rating
FROM
  properties
  JOIN property_reviews ON properties.id = property_reviews.property_id
GROUP BY
  properties.id
HAVING
  $ { isFirst } avg(property_reviews.rating) >= $ $ {
values
.length }
ORDER BY
  cost_per_night
LIMIT
  1;

lightbnb = # SELECT
lightbnb - #   properties.*,
lightbnb - #   avg(property_reviews.rating) as average_rating
lightbnb - # FROM
lightbnb - #   properties
lightbnb - #   JOIN property_reviews ON properties.id = property_reviews.property_id
lightbnb - # GROUP BY
lightbnb - #   properties.id
lightbnb - # HAVING
lightbnb - #   avg(property_reviews.rating) >= 5
lightbnb - # ORDER BY
lightbnb - #   cost_per_night
lightbnb - # LIMIT
lightbnb - #   1;
SELECT
  properties.*,
  avg(property_reviews.rating) as average_rating
FROM
  properties
  JOIN property_reviews ON properties.id = property_reviews.property_id
GROUP BY
  properties.id
HAVING
  avg(property_reviews.rating) >= $ 2
ORDER BY
  cost_per_night
LIMIT
  $ 2