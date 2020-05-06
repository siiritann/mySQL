var express = require('express');
var app = express();
var mysql = require('mysql');

app.set("view engine", "ejs"); // sellega mudin expressi default settinguid 

var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'join_us'
});

//mitte lõplik

//app.get("/", function(req,res){
// console.log(req);
// console.log('This is the join us app!')

 //	var q = 'SELECT COUNT(*) AS count FROM users';

	//connection.query(q, function (err, results) {
	//if (err) throw err;
	 //var count = results[0].count;  
	 //res.send("We have " + count + " users");
	 //});
//});

// lõplik 

app.get("/", function(req,res){
	var q = 'SELECT COUNT(*) AS count FROM users';
	connection.query(q,function(err, results){
		if (err) throw err;
		var msg = ("We have " + results[0].count + " users in the database");
		res.send(msg);
	})
})

app.get("/joke", function(req,res){
	var joke = "<strong>Insert </strong> <em>a stupid </em> joke here" 
	res.send(joke);
});

 app.get("/random_num", function(req,res){
	var num = (Math.floor(Math.random() * 10) + 1); 
 	res.send("Your lucky number is: " + num);
//	res.send(num)  // <-- see ei tööta sest res.sendiga saab saata Buffer, String, an Object and an Array tüüpi aga num pole ükski neist
 });



app.listen(3000, function(){
	console.log('Server running on 3000');
});


// connection.end();