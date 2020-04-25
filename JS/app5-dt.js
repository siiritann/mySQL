var faker = require('faker');
var mysql = require('mysql');

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'join_us'
});


var person = {
	email: faker.internet.email(),
	created_at: faker.date.past()
};

var end_result = connection.query('INSERT INTO users SET ?', person, function(err, results, fields) {
	if (err) throw err;
	console.log(results);
});


console.log(end_result.sql);

connection.end();





