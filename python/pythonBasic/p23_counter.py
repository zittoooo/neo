#!/usr/bin/env python

def counter(max):
    t = 0
    def output():
        print("t = %d" % t)

    while t < max:
        output()
        t += 1

n = input("input a number: ")
counter(int(n))
