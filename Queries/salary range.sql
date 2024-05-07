-- Query: Categorize participants based on their salary range

SELECT "Q3 - Current Yearly Salary (in USD)",
    COUNT("Unique ID") AS Number_of_Participants
FROM professionals_data
GROUP BY "Q3 - Current Yearly Salary (in USD)"
ORDER BY Number_of_Participants DESC