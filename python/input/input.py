#!/usr/bin/env python

n = int(input("How much number input? : "))

building = list(map(int, input().split()))
print("\n building : ", building)

min_build = min(building)
print("min(building) : ", min_build)

min_build_n = min(building) * n
print("min(building) * n : ", min_build_n)

sum_building = sum(building)
print("\nsum(building) : ", sum_building)

result = sum_building - min_build
print("\nsum(building) - min(building) : ", result)



