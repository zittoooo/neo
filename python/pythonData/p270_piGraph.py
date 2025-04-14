import pandas as pd
import matplotlib.pyplot as plt

plt.rcParams['font.family'] = 'NanumBarunGothic'

slice = [1, 2, 3, 4]
hobbids = ['잠자기', '외식', '여행', '운동']
mycolors = ['blue', '#6Aff00', 'green', '#ff003c']

plt.pie(slice, labels=hobbids, colors=mycolors, shadow=mycolors, explode = [0, 0.1, 0, 0],
        autopct='%1.2f%%', startangle=90, counterclock=False) # 시계방향

plt.legend(loc=4)

filename = 'p270_piGraph01.png'
plt.savefig(filename, dpi=400, bbox_inches='tight')
print(filename + ' saved')
plt.show()