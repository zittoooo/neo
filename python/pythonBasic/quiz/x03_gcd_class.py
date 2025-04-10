#!/usr/bin/env python

class Gcd(object):
    def __init__(self, a, b):
        self.a = a
        self.b = b
    def gcd(self):
        if self.b > self.a:
            self.a, self.b = self.b, self.a
        while self.b != 0:
            r = self.a % self.b
            self.a = self.b
            self.b = r
        return self.a

gcd1 = Gcd(100, 30)
print(gcd1.gcd())

