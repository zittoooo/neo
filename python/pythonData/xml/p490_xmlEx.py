from xml.etree.ElementTree import parse

tree = parse('xmlEx_03.xml')
myroot = tree.getroot()
print(type(myroot))
print(myroot)
print()

familys = myroot.findall('가족')
print(type(familys))
print(familys)
print()


for onefamily in familys:
    for one in onefamily:
        if len(one) >= 1:
            print(one[0].text)
        else:
            print(one.attrib['이름'])
    print()
print('finished')


