#!/usr/bin/env python

import calc_func

a = int(input("input a number: "))
b = int(input("input another number: "))

print(f'{a} + {b} = {calc_func.add(a, b)}')
print(f'{a} - {b} = {calc_func.sub(a, b)}')

