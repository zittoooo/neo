#!/usr/bin/env python
from pandas import Series

print('\n Unique and Count and isin')
mylist=['라일락', '코스모스', '코스모스', '백일홍', '코스모스', '코스모스', '들장미', '들장미', '라일락', '라일락']
myseries = Series(data=mylist)
print(myseries)

print('\n unique')
myunique = myseries.unique()
print(myunique)
print('-' * 50)

print('\n value_counts()')
mycount = myseries.value_counts()
print(mycount)
print('-' * 50)

print('\n isin')
#'들장미'나 '라일락'이면 True, 아니면 False인 마스크 시리즈를 만든다
mask = myseries.isin(['들장미', '라일락'])
print(mask)
print('-' * 50)

#마스크로 원본 시리즈에서 True인 값만 뽑는다
print(myseries[mask])
print('-' * 50)
print('Done')