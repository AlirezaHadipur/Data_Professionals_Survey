-- Query: Specify the education level of the participants

SELECT "Q12 - Highest Level of Education", count("Unique ID") AS Number_of_Participants
FROM professionals_data
WHERE "Q12 - Highest Level of Education" <> 'NONE'
GROUP BY "Q12 - Highest Level of Education"
ORDER BY Number_of_Participants DESC