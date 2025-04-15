import urllib.request
from bs4 import BeautifulSoup
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

plt.rcParams['font.family'] = 'NanumBarunGothic'
url = "http://www.moviechart.co.kr/rank/boxoffice"

html = urllib.request.urlopen(url)
soup = BeautifulSoup(html, 'html.parser')

mydata0 = [i for i in range(1, 21)]
mydata1 = []
title = soup.select("td.title")
for i in title:
    mydata1.append(i.text.strip())
#print(mydata1)

mydata2 = []
release = soup.select("td.date")
for i in release:
    mydata2.append(i.text)
#print(mydata2)

mydata3 = []
audience = soup.select("td.audience")
for i in audience:
    mydata3.append(i.text.replace("명", "").rstrip())
#print(mydata3)

mydata4 = []
cumulative = soup.select("td.cumulative")
for i in cumulative:
    mydata4.append(i.text.replace("명", "").rstrip())
#print(mydata4)

mydata5 = []
sales = soup.select("td.sales")
for i in sales:
    mydata5.append(i.text.replace("\r\n", "").replace(" ", ""))
#print(mydata5)

mycolumn = ['순위', '제목', '개봉일', '관객수', '누적관객수', '누적매출액']
myframe = pd.DataFrame(data=list(zip(mydata0, mydata1, mydata2, mydata3, mydata4, mydata5)), columns=mycolumn)
filename = 'quiz_03_movieChart.csv'
myframe.to_csv(filename, encoding='utf-8', index=False)
print(filename + ' saved')

dfmovie = myframe.reindex(columns=['제목', '관객수', '누적관객수'])
df = pd.concat([dfmovie['관객수'], dfmovie['누적관객수']], axis=1)
df['관객수'] = df['관객수'].str.replace(',', '').astype(float)
df['누적관객수'] = df['누적관객수'].str.replace(',', '').astype(float)

df = df.set_index(dfmovie['제목'])
df.columns = ['관객수', '누적관객수']
print(df)

df.astype(float).plot(kind='barh', title='영화별 관객수와 누적관객수', rot=0)
filename = 'quiz_03_movieChartGraph.png'
plt.savefig(filename, dpi=400, bbox_inches='tight')
plt.show()