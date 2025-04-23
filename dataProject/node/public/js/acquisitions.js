const ctx = document.getElementById('acquisitions');

const dead = document.getElementById('JGraph');

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