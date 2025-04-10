import os

myfolder = './'
newpath = os.path.join(myfolder, 'work')
try:
    os.mkdir(newpath)
    for idx in range(1, 11):
        newfile = os.path.join(myfolder, 'somefolder' + str(idx).zfill(2))
        os.mkdir(newfile)

except FileExistsError:
    print('Directory already exists')
finally:
    print('Done')

