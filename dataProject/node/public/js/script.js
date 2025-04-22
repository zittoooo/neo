
async function getAccidentData() {
	const year = document.getElementById("kids_year").value;
	const region = document.getElementById("kids_region").value;

	const url = `http://192.168.1.38:8000/getKidsAcc?year=${year}&region=${region}`;

	try {
		const response = await fetch(url);
		const data = await response.json();

		if (data.result_code === "success") {
			document.getElementById("result").innerHTML = `
			<h3>${region} ${year}년 어린이 교통사고</h3>
			<p>사고 건수: ${data.data.accident_count}</p>
			<p>사망자 수: ${data.data.death_count}</p>
			<p>부상자 수: ${data.data.injury_count}</p>
			`;
			//console.log(data);
		} else {
			document.getElementById("result").innerText = "데이터를 불러오지 못했습니다.";
		}
	} catch (err) {
	console.error("API 요청 오류:", err);
	document.getElementById("result").innerText = "요청 중 오류 발생!";
	}
}


async function getSeniorAccidentData() {
	const year = document.getElementById("senior_year").value;
	const region = document.getElementById("senior_region").value;

	const url = `http://192.168.1.38:8000/seniorAccident?year=${year}&region=${region}`;

	try {
		const response = await fetch(url);
		const data = await response.json();

		if (data.result_code === "success") {
			document.getElementById("result").innerHTML = `
			<h3>${region} ${year}년 노령 보행자 교통사고</h3>
			<p>사고 건수: ${data.data.accident_count}</p>
			<p>사망자 수: ${data.data.death_count}</p>
			<p>부상자 수: ${data.data.injury_count}</p>
			`;
			//console.log(data);
		} else {
			document.getElementById("result").innerText = "데이터를 불러오지 못했습니다.";
		}
	} catch (err) {
	console.error("API 요청 오류:", err);
	document.getElementById("result").innerText = "요청 중 오류 발생!";
	}
}


async function getPer10Accident() {
	const year = document.getElementById("per10_year").value;
	

	const kids = `http://192.168.1.38:8000/getper10Kids?year=${year}`;
	const senior = `http://192.168.1.38:8000/getper10Senior?year=${year}`;

	try {
		const kids_response = await fetch(kids);
		const senior_response = await fetch(senior);
		const data1 = await kids_response.json();
		const data2 = await senior_response.json();

		if (data1.result_code === "success") {
			document.getElementById("per10result").innerHTML = `
			<h6>어린이</h6>
			<p>어린이 인구 10만명 당 사고 건수: ${data1.data.per10}</p>

			<h6>노령자</h6>
			<p>노령 인구 10 만명 당 사고 건수: ${data2.data.per10}</p>
			`;
			//console.log(data);
		} else {
			document.getElementById("result").innerText = "데이터를 불러오지 못했습니다.";
		}
	} catch (err) {
	console.error("API 요청 오류:", err);
	document.getElementById("result").innerText = "요청 중 오류 발생!";
	}
}


async function safeZone() {
	const region = document.getElementById("regionSelect").value;
	const iframe = document.getElementById("safeZoneFrame");
	const url = `http://192.168.1.38:8000/safeZone?region=${region}`;

	iframe.src = url;
	
}
