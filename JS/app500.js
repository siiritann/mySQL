var faker = require('faker');
var mysql = require('mysql');

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'join_us'
});

// var person = {
//	email: faker.internet.email(),
//	created_at: faker.date.past()
//};

var data = [];
for (var i = 0; i < 500; i++) {
	data.push([
		faker.internet.email(),
		faker.date.past()
		])
};

// console.log(data)

var q = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(q, [data], function(err,results){
	if (err) throw err;
	console.log(results)
});

connection.end();


