SELECT first_name, AVG(grade) average, from students s LEFT JOIN papers p ON s.id = p.student_id GROUP BY s.id ORDER BY
 average DESC, first_name;
 
 SELECT first_name, AVG(grade) average, 
 CASE
 WHEN AVG(grade) > 75 THEN "PASSING"
 ELSE "FAILING"
 END AS passing_status
 from students s LEFT JOIN papers p ON s.id = p.student_id GROUP BY s.id ORDER BY
 average DESC;
 
 


SELECT REVERSE('Why does my cat look at me with such hatred?');

SELECT REPLACE(title, ' ', '->') AS title FROM books;

SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;

SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;

SELECT CONCAT(SUBSTRING(title,1,10),'...') AS 'short title' FROM books;

SELECT CONCAT(SUBSTRING(title,1,10),'...') AS 'short title', CONCAT(author_lname, ',', author_fname) AS 'author', CONCAT(stock_quantity, ' in stock') AS 'quantity' FROM books;

