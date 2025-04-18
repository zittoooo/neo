import json

def get_json_data():
    filename = 'jumsu.json'
    myfile = open(filename, mode='r', encoding='utf-8')
    #print(myfile)

    
    myfile = myfile.read()
    print(myfile)
    
    jsondata = json.loads(myfile)
    print(type(jsondata)) # <class 'list'>
    print(jsondata)
    
    for item in jsondata:
        print(item.keys())
        print(item.values())
        print('이름: ', item['name'])
        print('국어: ', item['kor'])
        print('영어: ', item['eng'])
        
        kor = float(item['kor'])
        eng = float(item['eng'])
        math = float(item['math'])
        total = kor + eng + math
        print('총첨: ', total)
        
        if 'hello' in item.keys():
            message = item['hello']
            print(message)
        
        
        _gender = item['gender'].upper()
        if _gender == 'M':
            print('남성')
        elif _gender == 'F':
            print('여성')
        else:
            print('성별 정보 없음')
        print()
        
if __name__ == '__main__':
    get_json_data()
