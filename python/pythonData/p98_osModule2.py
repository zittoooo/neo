import os

myfolder = './'
newpath = os.path.join(myfolder, 'work')
try:
    os.rmdir(newpath)
    for idx in range(1, 11):
        newfile = os.path.join(myfolder, 'somefolder' + str(idx).zfill(2))
        os.rmdir(newfile)

except FileNotFoundError:
    print('Directory does not exists')
finally:
    print('Done')

