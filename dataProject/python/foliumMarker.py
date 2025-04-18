import folium 
import requests, json
import os
from fastapi import FastAPI

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


app = FastAPI()

sido_code = {"서울" : "11", "부산" : "26"}
url = "http://www.utic.go.kr/guide/getSafeOpenJson.do"
params = '?key='
params += get_secret("key")
params += '&sidoCd=' + sido_code['서울']
url += params

response = requests.get(url)
response = response.json()
items = response.get("items", [])

for item in items:
    latitude = item['latitude']
    longitude = item['longitude']
    map_osm = folium.Map(location=[latitude, longitude], zoom_start=17)

#map_osm = folium.Map(location=[latitude, longitude], zoom_start=17)
# folium.Marker([latitude, longitude], popup='서울특별시청', icon=folium.Icon(color='red', icon='info-sign')).add_to(map_osm)
