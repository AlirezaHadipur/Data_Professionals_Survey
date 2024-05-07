-- Query: Compare the level of happiness(Salary) in each country

-- There is an issue in the cleaned dataset, with the following code we will fix this problem.
UPDATE professionals_data
SET "Q11 - Which Country do you live in?" = 'Nigeria'
WHERE "Q11 - Which Country do you live in?" = 'Nigeria ';

SELECT "Q11 - Which Country do you live in?",
    avg(
        "Q6 - How Happy are you in your Current Position  (Salary)"
    )::NUMERIC(10, 2) AS AVERAGE,
    COUNT("Unique ID") AS Number_of_Participants
    
FROM professionals_data
GROUP BY "Q11 - Which Country do you live in?"
HAVING COUNT("Unique ID") >= 5
    AND "Q11 - Which Country do you live in?" <> 'NONE'
ORDER BY AVERAGE DESC;