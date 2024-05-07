-- Query: What are the most popular programming languages?

SELECT "Q5 - Favorite Programming Language",
	COUNT("Unique ID") AS NUMBER_OF_PARTICIPANTS
FROM PROFESSIONALS_DATA
WHERE "Q5 - Favorite Programming Language" <> 'None'
GROUP BY "Q5 - Favorite Programming Language"
ORDER BY NUMBER_OF_PARTICIPANTS DESC;