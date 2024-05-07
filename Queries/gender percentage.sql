-- Query: Specify the gender percentage

SELECT "Q9 - Male/Female?", 
    ((CAST(count("Unique ID") AS FLOAT) / 624)*100)::numeric(10, 1) AS pertentage
FROM professionals_data
GROUP BY "Q9 - Male/Female?"