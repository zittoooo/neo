const express = require("express");
const path = require('path');
const app = express();
const PORT = 80

// 미들웨어
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(express.static(path.join(__dirname, 'public')));

// 뷰 엔진 설정 (HTML 렌더링)
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'html')
app.engine('html', require('ejs').renderFile);

//app.set('views', path.join(__dirname, '../safe'))
//app.set('view engine', 'html')
//app.engine('html', require('ejs').renderFile);

// 라우터
const mainRouter = require('./controllers/mainController');
app.use('/', mainRouter)

app.listen(PORT, function() {
  console.log("80 port : Server Started~!!");
})