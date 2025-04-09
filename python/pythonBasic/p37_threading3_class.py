#!/usr/bin/env python

import threading, requests, time

class HtmlGetter(threading.Thread):
    def __init__(self, url):
        threading.Thread.__init__(self)
        self.url = url
    def run(self):
        resp = requests.get(self.url)
        time.sleep(1)
        print(self.url, len(resp.text), 'chars')
t = HtmlGetter('http://google.com')
t.start()


print('### END ###')

## 메인 스레드가 먼저 실행되고 끝나서 end가 찍히고 나중에 서브 스레드가 글자수를 세서 프린트 함