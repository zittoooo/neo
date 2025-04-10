#!/usr/bin/env python

a = int(input("input First number : "))
b = int(input("input Second number : "))

while b > 0:
    r = a % b
    if r == 0:
        print(b)
    a = b
    b = r