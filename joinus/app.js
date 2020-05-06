var express = require('express');
var app = express();
var mysql = require('mysql');
var bodyParser = require('body-parser'); // parses request body 

// configuration read on koos 
app.set("view engine", "ejs"); // sellega mudin expressi default settinguid 
app.use(bodyParser.urlencoded({extended: true})); // allows to extract info from POST request 
app.use(express.static(__dirname + "/public")); // seob ära public folderiga kus istuvad css failid 


var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'join_us'
});


app.get("/", function(req,res){
	var q = 'SELECT COUNT(*) AS count FROM users';
	connection.query(q,function(err, results){
		if (err) throw err;
		var count = results[0].count;
		res.render('home', {count: count});
	})
})

app.get("/joke", function(req,res){
	var joke = "<strong>Insert </strong> <em>a stupid </em> joke here" 
	res.send(joke);
});

 app.get("/random_num", function(req,res){
	var num = (Math.floor(Math.random() * 10) + 1); 
 	res.send("Your lucky number is: " + num);
 });

app.post('/register', function(req,res){
//	console.log(req.body);
//	console.log("POST request sent to /register is " + req.body.email);

	var person = {
		email: req.body.email	
	};
	
// alternatiiv
//	var q = "INSERT INTO users (email) VALUES (" + req.body.email + ")"
// 	connection.query(q, function(err, results) ... 
	
	
	connection.query('INSERT INTO users SET ?', person, function(err, results) {
	if (err) throw err;
// 	console.log(results);
	res.redirect('/');
//	res.send("Thanks for joining the wait list!");

	});
});


app.listen(3000, function(){
	console.log('Server running on 3000');
});

