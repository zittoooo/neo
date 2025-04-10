#!/usr/bin/env python

import random

class binaryDigits(object):
    def __init__(self, num, lists):
        self.num = num
        self.lists = lists
    def convert(self):
        q = self.num
        while True:
            r = q % 2
            q = q // 2

            self.lists.append(r)
            if q == 0:
                break
        self.lists.reverse()
        return self.lists

list = []
num = random.randrange(4, 20)
binary1 = binaryDigits(num, list)
print(f'{num} binary number is : {binary1.convert()}')