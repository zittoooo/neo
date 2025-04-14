# ex5-10.html
from bs4 import BeautifulSoup
import numpy as np
from pandas import DataFrame as df
import matplotlib.pyplot as plt

plt.rcParams['font.family'] = 'NanumBarunGothic'
html = open('/work/neo/html/source/5/ex5-10.html', 'r', encoding='utf-8')
soup = BeautifulSoup(html, 'html.parser')


list = []
for td in soup.find_all('td'):
    print(td.text)
    list.append(td.text)



mycolumns = ['이름', '국어', '영어']

myframe = df(np.reshape(np.array(list), (4, 3)), columns=mycolumns)
myframe = myframe.set_index('이름')
print(myframe)

# 주의
myframe.astype(float).plot(kind='line', title='Score', legend=True)

filename = 'quiz_01_scoreGraph.png'
plt.savefig(filename, dpi=400, bbox_inches='tight')
print(filename + ' saved')
plt.show()