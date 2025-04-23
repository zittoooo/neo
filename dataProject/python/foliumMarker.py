import folium 
import requests, json
import os
from fastapi import FastAPI
from database import collection


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


sido_code = sido_code = {"서울" : "11", "부산" : "26", "대구": "27", "인천": "28", "광주": "29", "대전": "30", "울산": "31", "세종": "31",
            "경기": "41", "강원": "42", "충북": "43", "충남": "44", "전북": "45", "전남": "46", "경북": "47", "경남": "48", "제주": "50"}
url = "http://www.utic.go.kr/guide/getSafeOpenJson.do"
params = '?key=' + get_secret("key") + '&sidoCd=' + sido_code["제주"]
url += params


response = requests.get(url)
response = response.json()
items = response.get("items", [])


#print(f"{len(items)}건 저장 완료")

# map_osm = folium.Map(location=[37.4946639663726, 127.02756080657997], zoom_start=17)
for item in items:
    item['region'] = '제주'
    collection.insert_one(item)

one = collection.find_one({"REGION": "제주"})
print(one)
    #map_osm = folium.Map(location=[latitude, longitude], zoom_start=17)
    # folium.Marker([latitude, longitude], popup='서울특별시청', icon=folium.Icon(color='red', icon='info-sign')).add_to(map_osm)
# map_osm.save('test.html')
# print('file saved..')

