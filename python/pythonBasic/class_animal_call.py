#!/usr/bin/env python

from class_animal import *

dog = Dog('doggy')
print(dog.name)
dog.move()
dog.speak()
print()

duck = Duck('donald')
print(duck.name)
duck.move()
duck.speak()
print()

zoo = [Dog('marry'), Duck('dduck')]

for z in zoo:
    print(z.name)
    z.speak()


