var mysql = require('mysql');

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'join_us'
})

// var q = 'SELECT COUNT(*) AS total FROM users';
 var q = 'INSERT INTO users (email) VALUES ("con9876@mailinator.com")';


connection.query(q, function (error, results, fields) {
	if (error) throw error;
	console.log(results);
//	console.log(results[0].total);	
//	console.log(results [1].email);
});

connection.end();