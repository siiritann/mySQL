# SELECT CONCAT(
# SUBSTRING(
# title, 1, 10),'...')
# AS 'short title'
# FROM books;

SELECT SUBSTRING(
		REPLACE(title, 'e', '3')
		,1
		,10
	) AS weird_string
FROM books;

