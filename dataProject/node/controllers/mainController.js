const express = require("express");
const router = express.Router();
const axios = require("axios");

// 메인 페이지 렌더링
router.get("/", (req, res) => {
  res.render("index");
});

router.get('/hello', (req, res) => {
  res.send({data : 'Hello World!!'});
})

// 노인 교통사고 전체
let option1 = 'http://192.168.1.38:3000/r_seniorAccident';
router.get('/seniorAccident', async function(req, res) {
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

// 어린이 보행자 교통사고 전체
let option2 = 'http://192.168.1.40:3000/r_getKidsAcc';
router.get('/getKidsAcc', async function(req, res) {
  const { year, region } = req.query;

  try {
    const result = await axios.get(option2, {
      params: { year, region },
    });

    //print(result)

    const response = {
      result_code: "success",
      data: {
        accident_count: result.data.data[0].ACCIDENT_COUNT,
        death_count: result.data.data[0].DEATH_COUNT,
        injury_count: result.data.data[0].INJURY_COUNT
      }
    }

    res.send(response);
  } 
  catch (err) {
    console.error("외부 API 호출 오류:", err.message);
    res.status(500).send({ error: '내부 서버 오류 발생' });
  }
});


let option4 = 'http://192.168.1.40:3000/r_getper10kids';
router.get('/getper10kids', async function(req, res) {
  const { year } = req.query;

  try {
    const result = await axios.get(option4, {
      params: {year},
    });

    const response = {
      result_code: "success",
      data: {
        population: result.data.data[0].population,
        accident: result.data.data[0].accident_count,
        per10: result.data.data[0].per10acc
      }
    }
    res.send(response);
  } 
  catch (err) {
    console.error("외부 API 호출 오류:", err.message);
    res.status(500).send({ error: '내부 서버 오류 발생' });
  }
});


let option5 = 'http://192.168.1.40:3000/r_getper10senior';
router.get('/getper10senior', async function(req, res) {
  const { year } = req.query;

  try {
    const result = await axios.get(option5, {
      params: {year},
    });

    const response = {
      result_code: "success",
      data: {
        population: result.data.data[0].population,
        accident: result.data.data[0].accident_count,
        per10: result.data.data[0].per10acc
      }
    }
    res.send(response);
  } 
  catch (err) {
    console.error("외부 API 호출 오류:", err.message);
    res.status(500).send({ error: '내부 서버 오류 발생' });
  }
});

// let option6 = 'http://192.168.1.40:3000/r_kidsAccidentInZone';
// router.get('/kidsAccidentInZone', async function(req, res) {
//   const { year, region } = req.query;

//   try {
//     const result = await axios.get(option6, {
//       params: {year, region},
//     });

//     const response = {
//       result_code: "success",
//       data: {
//         accident: result.data.data[0].accident_count,
//         death_count: result.data.data[0].death_count,
//         injury_count: result.data.data[0].injury_count
//       }
//     }
//     res.send(response);
//   } 
//   catch (err) {
//     console.error("외부 API 호출 오류:", err.message);
//     res.status(500).send({ error: '내부 서버 오류 발생' });
//   }
// });


// 보호구역 현황
let option3 = 'http://192.168.1.38:3000/r_safeZone';
router.get('/safeZone', async function(req, res) {
  const { region } = req.query;

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

module.exports = router;


