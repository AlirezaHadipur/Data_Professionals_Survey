-- Query: level of happiness(in total) based on job title

-- First of all, we need a table that add up the 6 columns about happiness.
CREATE TEMP TABLE TEMP_T AS
SELECT  "Unique ID", 
        "Q1 - Which Title Best Fits your Current Role?",
        (SUM(
            "Q6 - How Happy are you in your Current Position  (Salary)" +
            "Q6 - How Happy are you in your Current Position (Coworkers)" +
            "Q6 - How Happy are you in your Current Position (Learning New T" +
            "Q6 - How Happy are you in your Current Position (Management)" +
            "Q6 - How Happy are you in your Current Position (Upward Mobilit" + 
            "Q6 - How Happy are you in your Current Position (Work/Life Bala"
        )/6 )::NUMERIC(10, 2) as average_of_happiness
FROM  professionals_data
GROUP BY "Unique ID";

-- Then we have to compute the average of happiness for each job
SELECT  "Q1 - Which Title Best Fits your Current Role?",
        AVG(average_of_happiness)::NUMERIC(10, 2) AS AVERAGE,
        count("Unique ID") AS Number_of_Participants
FROM TEMP_T
WHERE  "Q1 - Which Title Best Fits your Current Role?" NOT LIKE '%Student%'
GROUP BY "Q1 - Which Title Best Fits your Current Role?"
HAVING count("Unique ID") >= 5
ORDER BY AVERAGE DESC