const express = require("express");
const axios = require('axios');
const CircularJSON = require('circular-json');
const app = express();

app.get('/', (req, res) => {
  res.send("Web Server Started...");
})

app.get('/hello', (req, res) => {
  res.send({data : 'Hello World!!'});
})

let option1 = 'http://192.168.1.38:3000/r_seniorAccident';
app.get('/seniorAccident', async function(req, res) {
  const { year, region } = req.query;

  try {
    const result = await axios.get(option1, {
      params: { year, region },
    });
    
    const response = {
      result_code: "success",
      data: {
        accident_count: result.data[0].ACCIDENT_COUNT,
        death_count: result.data[0].DEATH_COUNT,
        injury_count: result.data[0].INJURY_COUNT
      }
    }
    res.send(response);
  } 
  catch (err) {
    console.error("외부 API 호출 오류:", err.message);
    res.status(500).send({ error: '내부 서버 오류 발생' });
  }
});


let option2 = 'http://192.168.1.40:3000/r_getkidsacc';
app.get('/kidsAccident', async function(req, res) {
  const { year, region } = req.query;

  try {
    const result = await axios.get(option2, {
      params: { year, region },
    });

    const response = {
      result_code: "success",
      data: {
        accident_count: result.data[0].ACCIDENT_COUNT,
        death_count: result.data[0].DEATH_COUNT,
        injury_count: result.data[0].INJURY_COUNT
      }
    }

    res.send(response);
  } 
  catch (err) {
    console.error("외부 API 호출 오류:", err.message);
    res.status(500).send({ error: '내부 서버 오류 발생' });
  }
});


let option3 = 'http://192.168.1.38:3000/r_safeZone';
app.get('/safeZone', async function(req, res) {
  const region = req.query;

  try {
    const response = await axios.get(option3, {
      params: region,
    });


    res.send(response.data);
  } 
  catch (err) {
    console.error("외부 API 호출 오류:", err.message);
    res.status(500).send({ error: '내부 서버 오류 발생' });
  }
});



app.listen(8000, function() {
  console.log("8000 port : Server Started~!!");
})