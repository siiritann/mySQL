SELECT title, author_lname, 
CONCAT(COUNT(*), CASE WHEN COUNT(*) >1 THEN ' books' ELSE ' book' END
	  ) AS COUNT 


FROM books 
GROUP BY author_lname, author_fname;


// tema lahendus

SELECT title, author_lname,
CASE 
WHEN COUNT(*) = 1 THEN '1 book'
ELSE CONCAT(COUNT(*),' books')
END AS COUNT
FROM books
GROUP BY author_lname, author_fname;