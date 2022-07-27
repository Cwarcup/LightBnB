-- Average Length Of Reservation
-- Our product managers want a query to see the average duration of a reservation.
-- Instruction
-- Get the average duration of all reservations.
SELECT
  avg(end_date - start_date) as average_duration
FROM
  reservations;