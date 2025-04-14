import pandas as pd
import matplotlib.pyplot as plt

# 폰트 설치하기

filename = 'mygraph.csv'

myframe = pd.read_csv(filename, index_col='이름', encoding='utf-8')
myframe.index.name = '이름'
myframe.columns.name = '시험과목'

myframe.plot(title='학생별 누적 시험 성적', kind='bar', rot=0, stacked=True, legend=True)
filename = 'Ex_p239_07.png'
plt.savefig(filename, dpi=400, bbox_inches='tight')
print(filename + ' saved')
plt.show()