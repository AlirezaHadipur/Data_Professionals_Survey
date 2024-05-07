-- Query: What is the percentage of participants that switched their previous job into data?

SELECT "Q2 - Did you switch careers into Data?",
	((CAST(COUNT("Unique ID") AS FLOAT)/624)*100)::numeric(10, 3) AS SWITCH_CAREERS
FROM PROFESSIONALS_DATA
GROUP BY "Q2 - Did you switch careers into Data?"
