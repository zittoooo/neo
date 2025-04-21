from fastapi import FastAPI
from fastapi.responses import HTMLResponse
import folium
import os, json, requests
from database import db_conn, collection
from models import Senior
from sqlalchemy import *


app = FastAPI(debug=True)

db = db_conn()
session = db.sessionmaker()

BASE_DIR = os.path.dirname(os.path.dirname(os.path.relpath("./")))
secret_file = os.path.join(BASE_DIR, '../../secret.json')

with open(secret_file) as f:
    secrets = json.loads(f.read())
    
def get_secret(setting, secrets=secrets):
    try:
        return secrets[setting]
    except KeyError:
        errorMsg = "Set the {} environment variable.".format(setting)
        return errorMsg

@app.get("/r_seniorAccident")
def getSeniorAccident(year=2023, region='서울'):
    if (year is None) or (region is None):
        return "연도와 지역을 입력하세요."
    else :
        result = session.query(Senior).filter(Senior.YEAR == year, Senior.REGION == region).all()
        
        if result:
            print(result)
            return result
        else:
            return "연도와 지역을 찾을 수 없습니다."
        

@app.get("/r_safeZone", response_class=HTMLResponse)
async def generate_map(region: str):
    sido_code = sido_code = {"서울" : "11", "부산" : "26", "대구": "27", "인천": "28", "광주": "29", "대전": "30", "울산": "31", "세종": "31",
             "경기": "41", "강원": "42", "충북": "43", "충남": "44", "전북": "45", "전남": "46", "경북": "47", "경남": "48", "제주": "50"}
    
    # if  collection.count_documents({"REGION": region}):
    #     items = list(collection.find({"REGION": region}))
    #     print("mongodb에서 찾기 완료")
    # else:
    url = "http://www.utic.go.kr/guide/getSafeOpenJson.do"
    params = '?key=' + get_secret("key") + '&sidoCd=' + sido_code[region]
    url += params

    response = requests.get(url)
    response = response.json()
    items = response.get("items", [])
    print("api에서 호출 완료")

    map_osm = folium.Map(location=[37.4946639663726, 127.02756080657997], zoom_start=7)
    for item in items:
        latitude = item['Y'] # 위도
        longitude = item['X'] # 경도 126.984250187332
        fclty_ty = item['FCLTY_TY']
        name = item['FCLTY_NM']
        if fclty_ty == '1':  # 어린이 보호구역
            folium.Marker([latitude, longitude], popup=name, icon=folium.Icon(color='red', icon='info-sign')).add_to(map_osm)
        else: # 노인 보호구역
            folium.Marker([latitude, longitude], popup=name, icon=folium.Icon(color='blue', icon='info-sign')).add_to(map_osm)
        item['REGION'] = region
        item.pop('_id', None)
        collection.insert_one(item)
    # 3. HTML 문자열로 렌더링
    map_html = map_osm._repr_html_()
    
    return HTMLResponse(content=map_html)
    