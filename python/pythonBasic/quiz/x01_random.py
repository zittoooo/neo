#!/usr/bin/env python

import random

data = random.sample(range(1, 101), 10)
print(data)

# 가장 큰 값 구하기
print('Max value is :', max(data))

mx = data[0]
for i in range(len(data)):
    if data[i] > mx:
        mx = data[i]
print(mx)