# 결제 총액과 팁 비용의 산점도 그리기 (성별에 따라 누가 많이 주는지)
import pandas as pd
import matplotlib.pyplot as plt

plt.rcParams['font.family'] = 'NanumBarunGothic'

filename='tips.csv'
myframe = pd.read_csv('tips.csv', encoding='utf-8')
mycolor = ['r', 'b']
labels = ['Female', 'Male']

cnt = 0

for finditem in labels:
    xdata = myframe.loc[myframe['sex'] == finditem, 'total_bill']
    ydata = myframe.loc[myframe['sex'] == finditem, 'tip']
    plt.plot(xdata, ydata, label = finditem, color = mycolor[cnt], marker = 'o', linestyle='None')
    cnt += 1
    
plt.legend(loc=2)
plt.xlabel('total_bill')
plt.ylabel('팁비용')
plt.grid(True)
plt.title('결제 총액과 팁 비용의 산점도')

filename = 'Ex_p239_08.png'
plt.savefig(filename, dpi=400, bbox_inches='tight')
print(filename + ' saved')
plt.show()
