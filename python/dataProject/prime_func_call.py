#!/usr/bin/env python

import prime_func
while True:
    num = int(input("input a number(0: quit): "))

    if num == 0:
        break
    if (num < 2):
        print("re-enter number~!!")
        continue

    if prime_func.prime(num):
        print(f'{num} is prime')
    else:
        print(f'{num} is not prime')

