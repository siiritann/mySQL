var express = require('express');
var app = express();

app.get("/", function(req,res){
	// console.log('This is the join us app!')
	res.send("This is the join us app!")
})



app.listen(3000, function(){
	console.log('Server running on 3000');
});