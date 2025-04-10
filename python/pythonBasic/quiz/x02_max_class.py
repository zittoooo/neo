#!/usr/bin/env python

import random

class FindMax(object):
    def __init__(self, data):
        self.data = data
    def max(self):
        mx = self.data[0]
        for i in range(len(self.data)):
            if self.data[i] > mx:
                mx = self.data[i]
        return mx

data = random.sample(range(1, 101), 10)
print(data)

data1 = FindMax(data)
print(f'Max Value is: {data1.max()}')