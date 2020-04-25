var faker = require('faker');
var mysql = require('mysql');

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'join_us'
});


var person = {email: faker.internet.email()};



// selline kontseptsioon ei toimi !!!  var q = 'INSERT INTO users (email, created_at) VALUES (faker.internet.email(), faker.date.past())';
	
connection.query('INSERT INTO users SET ?', person, function (error, results, fields) {
	if (error) throw error;
	console.log(results);
});

connection.end();

console.log(faker.date.past());

