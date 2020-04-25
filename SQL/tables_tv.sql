CREATE TABLE reviewers (
         id INT AUTO_INCREMENT PRIMARY KEY,    
         first_name VARCHAR(100),    
         last_name VARCHAR(100)    
     );
	

CREATE TABLE series(    
	 id INT AUTO_INCREMENT PRIMARY KEY,    
	 title VARCHAR(100),    
	 released_year YEAR(4),    
	 genre VARCHAR(100)    
 );


 CREATE TABLE reviews (    
	 id INT AUTO_INCREMENT PRIMARY KEY,    
	 rating DECIMAL(2,1),    
	 series_id INT,    
	 reviewer_id INT,    
	 FOREIGN KEY(series_id) REFERENCES series(id),    
	 FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)    
 );
	

SELECT title AS 'unreviewed series' FROM series where title not in 
	(
		SELECT title FROM series s JOIN reviews r on s.id = r.series_id
	);
	
SELECT title AS 'unreviewd series' FROM series s LEFT JOIN reviews r on s.id = r.series_id
WHERE rating IS NULL;


// üks versioon

SELECT first_name, last_name, 
COUNT(rating) AS COUNT,
IFNULL(MIN(rating),0) AS MIN,
IFNULL(MAX(rating),0) AS MAX,
IFNULL(AVG(rating),0) AS AVG,
CASE
	WHEN COUNT(rating) > 0 THEN 'ACTIVE'
	ELSE 'INACTIVE'
END AS STATUS
FROM reviewers r
LEFT JOIN reviews re ON r.id = re.reviewer_id 
GROUP BY r.id;



// ilusam versioon

SELECT first_name, last_name, 
COUNT(rating) AS COUNT,
IFNULL(MIN(rating),0) AS MIN,
IFNULL(MAX(rating),0) AS MAX,
ROUND(IFNULL(AVG(rating),0),2) AS AVG,
IF(COUNT(rating) > 1,'ACTIVE','INACTIVE') AS STATUS
FROM reviewers r
LEFT JOIN reviews re ON r.id = re.reviewer_id 
GROUP BY r.id;




SELECT
title,
rating,
CONCAT(first_name, ' ', last_name) AS reviewer
FROM series s
JOIN reviews re ON s.id = re.series_id
JOIN reviewers r ON (r.id = re.reviewer_id)
ORDER BY s.id;
