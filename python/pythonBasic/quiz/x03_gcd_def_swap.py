#!/usr/bin/env python


def gcd(a, b):
    if a < b:
        a, b= b, a
    while b != 0:
        r = a % b
        a, b = b, r
    return a

a = int(input("input First number : "))
b = int(input("input Second number : "))

print(gcd(a, b))