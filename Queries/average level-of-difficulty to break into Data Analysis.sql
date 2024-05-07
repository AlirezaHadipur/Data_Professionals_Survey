-- Query: What is the average level-of-difficulty to break into Data Analysis

-- First, we need to filter the data to have only
-- the participants with Data Analyst job title
CREATE TEMP TABLE Temporary AS 
SELECT * FROM professionals_data
WHERE "Q1 - Which Title Best Fits your Current Role?" LIKE '%Data Analyst%';

-- Then we use the count of Data Anlaysts in the following query
SELECT  "Q1 - Which Title Best Fits your Current Role?",
        "Q7 - How difficult was it for you to break into Data?",
    (
        (CAST(COUNT("Unique ID") AS FLOAT)/
        (SELECT COUNT("Unique ID") FROM Temporary)) * 100
    )::Numeric(10, 1) AS percent

FROM Temporary
GROUP BY "Q1 - Which Title Best Fits your Current Role?",
    "Q7 - How difficult was it for you to break into Data?"
ORDER BY percent DESC
