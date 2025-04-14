from pandas import Series
import matplotlib.pyplot as plt

plt.rcParams['font.family'] = 'Malgun Gothic'

mylist = [30,20,40,30,60]
myindex = ['감강찬', '김유신', '이순신', '안익태', '윤동주']
myseries = Series(data=mylist, index=myindex)
myseries.plot(kind='bar', rot=0, use_index=True, grid=False, color = ['r', 'g', 'b', 'y', 'c'])

plt.xlabe('학생이름')
plt.ylabel('점수')
plt.title('학생점수')

ratio = 100 * series / myseries.sum()
print(round(ratio, 1))
print('-' * 50)

for idx in range(myseries.size):
    value = str(myseries.iloc[idx]) + '건'
    ratioval = '%.1f' % ratio.iloc[idx]
    
    plt.text(x=idx, y=myseries.iloc[idx], s=value, ha='center', va='bottom')
    plt.text(x=idx, y=myseries.iloc[idx], s=ratioval, ha='center', va='bottom')
    
meanval = myseries.mean()
print(meanval)
print('-' * 50)

average = '평균 : %d건' % meanval
plt.axhline(y=meanval, color='r', linestyle='--', linewidth=1)
plt.text(x=0, y = meanval + 1, s=average, ha='center', va='bottom')

filename = 'ex_p239_06_Graph.png'
plt.savefig(filename, dpi=400, bbox_inches='tight')
print(filename + ' saved')
plt.show()