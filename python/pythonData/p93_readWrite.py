myfile01 = open('sample.txt', 'rt', encoding='utf-8')
linelists = myfile01.readlines()
myfile01.close()
print(linelists)

myfile02 = open('sample.txt', 'wt', encoding='utf-8')
total = 0
for o in linelists:
    score = int(o)
    total += score
    myfile02.write('total = ' + str(total) + ', value = ' + str(score) + '\n')

averate = total / len(linelists)

myfile02.write('총점 = ' + str(total) + '\n')
myfile02.write('평균점 = ' + str(averate) + '\n')
myfile02
print("done~!!")


myfile03 = open('result.txt', 'rt', encoding='utf-8')
line = 1

while line:
    line = myfile03.readline()
    print(line)
myfile03.close