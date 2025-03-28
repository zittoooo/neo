var express = require('express');
var mysql = require('mysql');
var env = require('dotenv').config({ path: "../../.env" });
var app = express();

var connection = mysql.createConnection({
  host: process.env.host,
  user: process.env.user,
  password: process.env.password,
  database: process.env.database
});

connection.connect(function(err) {
  if (err) {
    console.error('mysql connection error : ' + err);
    return;
  }
  console.log('mysql connection success');
});

app.get('/', function (req, res) {
  connection.query('SELECT * FROM st_info', function (err, rows, fields) {
    connection.end();
    if (err) {
      res.send(rows);
      console.log("The soulution is : ", rows);
    } else {
      console.log("Error while performing Query.\n\n");
    }
  }) 
})