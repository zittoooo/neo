const ctx = document.getElementById('acquisitions');

const dead = document.getElementById('JGraph');

const mctx = document.getElementById('mixChart').getContext('2d');

const mixChart = new Chart(mctx, {
   type: 'bar', // 기본 차트 타입은 bar로 지정
   data: {
      labels: ['2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023'],
      datasets: [
            {
               label: '사고건수',
               data: [434, 406, 409, 488, 324, 369, 389, 363],
               backgroundColor: 'rgba(75, 50, 192, 0.2)',
               borderColor: 'rgba(75, 50, 192, 1)',
               borderWidth: 1,
               yAxisID: 'y1'
            },
            {
               label: '사망자수',
               data: [8,8,3,6,3,2,3,2],
               type: 'line', // 이 dataset은 line 타입
               borderColor: 'rgba(100, 100, 150, 1)',
               backgroundColor: 'rgba(100, 99, 150 , 0.2)',
               fill: false, // 영역 채우기 없음
               //tension: 0.3 , // 곡선 부드럽게
               yAxisID: 'y2'
            }
      ]
   },
   options: {
      responsive: false,
      scales: {
         y1: { // 첫 번째 y축 (Bar chart)
            beginAtZero: true,
            position: 'left', // 왼쪽에 표시
        },
        y2: { // 두 번째 y축 (Line chart)
            beginAtZero: true,
            grace: '50%',
            position: 'right', // 오른쪽에 표시
            ticks: {
                max: 20, // y2 축의 최대값을 20으로 제한해서 변화가 잘 보이게 설정
                min: 1,  // 최소값 0으로 설정
            }
        }
            
      }
   }
});




const myChart = new Chart(dead, {
    type: 'doughnut', // 차트 타입을 도넛으로 변경
    data: {
        labels: ['중간연령층', '어린이','노령층'],
        datasets: [{ //RBYGPO
            label: 'Votes',
            data: [36.6, 1.4, 62],
            backgroundColor: [
                'rgba(54, 162, 235, 0.6)',
                'rgba(255, 206, 86, 0.6)',
                'rgba(153, 102, 255, 0.6)',
            ],
            borderColor: [
                'rgba(255, 255, 255, 1)' // 테두리 색을 흰색으로 하면 도넛 느낌 더 잘 나옴
            ],
            borderWidth: 2
        }]
    },
    options: {
        responsive: false,
        plugins: {
            legend: {
                position: 'top'
            },
            title: {
                display: true,
                text: '사망률'
            }
        }
    }
});


const data = {
  labels: ['2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023'],
  datasets: [
    {
      label: '어린이 인구 10만명당 사고건수',
      data: [90.62, 81.32, 69.49, 71.80, 37.64, 43.51, 48.58, 44.96],
      borderColor: 'rgba(255, 99, 132, 1)',
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
      tension: 0.3
    },
    {
      label: '노인 인구 10만명당 사고건수',
      data: [163.43, 162.89, 154.34, 152.61, 114.64, 111.79, 112.64, 112.21],
      borderColor: 'rgba(54, 162, 235, 1)',
      backgroundColor: 'rgba(54, 162, 235, 0.2)',
      tension: 0.3
    }
  ]
};

const config = {
  type: 'line',
  data: data,
  options: {
    responsive: true,
    plugins: {
      title: {
        display: true,
        // text: '어린이 vs 노인 인구 10만명당 교통사고 건수'
      }
    },
    scales: {
      y: {
        beginAtZero: false,
        title: {
          display: true,
          text: '사고 건수'
        }
      },
      x: {
        title: {
          display: true,
          text: '연도'
        }
      }
    }
  }
};

new Chart(ctx, config);