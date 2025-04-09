#!/usr/bin/env python

numbers = (i for i in range(1, 101))
data = list(numbers)

item = [3, 6, 9]

for i in data:
    if i % 10 in item:
        pass
    elif i // 10 in item:
        pass
    else:
        pass
