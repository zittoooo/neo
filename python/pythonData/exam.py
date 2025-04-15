
import requests

url = 'http://openapi.seoul.go.kr:8088/sample/xml/CardSubwayStatsNew/1/5/20220301'

response = requests.get(url)
print(response.content)