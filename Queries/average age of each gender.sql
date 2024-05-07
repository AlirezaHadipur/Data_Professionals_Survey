-- Query: Compute the average age of each gender

SELECT "Q9 - Male/Female?",
    avg("Q10 - Current Age")::numeric(10, 2) as AVERAGE_of_AGE
FROM professionals_data
GROUP BY "Q9 - Male/Female?"