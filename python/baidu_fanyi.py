#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import requests
import re

class BaiduSignDecode():
    i = None
    gtk = None
    def __init__(self, gtk):
        self.gtk = gtk

    def zero_fill_right_shift(self, val, n):
        return (val >> n) if val >= 0 else ((val + 0x100000000) >> n)

    def a(self, r):
        return r

    def n(self, r, o):
        for t in range(0, len(o) - 2, 3):
            a = o[t + 2]
            if a >= "a":
                a = ord(a) - 87
            else:
                a = int(a)
            if o[t + 1] == "+":
                a = self.zero_fill_right_shift(r, a)
            else:
                a = r << a
            if o[t] == "+":
                r = r + a & 4294967295
            else:
                r^=a
        if r > 0x7fffffff:
            r = r - 0xffffffff - 1
        return r


    def e(self, r):
        o = re.match("[\uD800-\uDBFF][\uDC00-\uDFFF]", r)
        if not o:
            t = len(r)
            if t > 30:
                r = "" + r[0:10] + r[int(t/2) - 5:10 + int(t/2) - 5] + r[-10:]
        else:
            e = re.split("[\uD800-\uDBFF][\uDC00-\uDFFF]", r)
            h = len(e)
            f = []
            for C in range(h):
                try:
                    if e[C]:
                        f = f + a(e[C].split(""))
                except:
                    pass
                if C != h - 1:
                    f.append(o[C])
            g = len(f)
            if g > 30:
                r = "".join(x for x in f[0:10]) + "".join(x for x in f[Math.floor(g / 2) - 5:Math.floor(g / 2) + 5]) + \
                    "".join(x for x in f[-10:])

        u = 0
        if self.i:
            u = self.i
        else:
            if self.gtk:
                u = self.gtk
            else:
                u = ""

        d = u.split(".")
        m = s = c = 0
        try:
            m = int(d[0])
        except:
            m = 0
        try:
            s = int(d[1])
        except:
            s = 0
        S = {}

        for v in range(len(r)):
            A = ord(r[v])
            if 128 > A:
                S[c] = A
                c+=1
            else:
                if 2048 > A:
                    S[c] = A >> 6 | 192
                    c+=1
                else:
                    if (64512 & A) == 55296 and v + 1 < len(r) and (64512 & ord(r[v + 1])) == 56321:
                        v+=1
                        A = 65536 + ((1023 & A) << 10) + (1023 & ord(r[v]))
                        S[c] = A >> 18 | 240,
                        c+=1
                        S[c] = A >> 12 & 63 | 128
                        c+=1
                    else:
                        S[c] = A >> 12 | 224
                        c+=1
                        S[c] = A >> 6 & 63 | 128
                        c+=1
                    S[c] = 63 & A | 128
                    c+=1
        
        p = m
        F = "+-a^+6"
        D = "+-3^+b+-f"
        for b in range(len(S)):
            p += S[b]
            p = self.n(p, F)

        p = self.n(p, D)
        p ^= s
        if 0 > p:
            p = (2147483647 & p) + 2147483648
        p %= 1e6

        return str(int(p)) + "." + str(int(p) ^ m)

class BaiduTransAPI():
    url_root = "https://fanyi.baidu.com/"
    url_trans = "https://fanyi.baidu.com/v2transapi"

    headers = {
        "origin": "https://fanyi.baidu.com",
        "referer": "https://fanyi.baidu.com",
        "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36"
    }
    cookies = {}

    def __init__(self):
        self.session = requests.session()
        self.session.headers = self.headers

        self.token, self.gtk = self.get_gtk_token()

    def get_gtk_token(self):
        page = self.session.get(self.url_root)
        self.cookies = page.cookies

        response = self.session.get(self.url_root, cookies=self.cookies)
        response = response.content.decode()
    
        token = re.findall(r"token: '(.+)'", response)[0]
        gtk = re.findall(r";window.gtk = '(.+)';", response)[0]

        return token, gtk

    def trans(self, input_string):
        if not input_string.strip():
            return ""
        
        decode = BaiduSignDecode(self.gtk)
 
        data = {
            "from": 'en',
            "to": 'zh',
            "query": input_string,
            "transtype": "realtime",
            "simple_means_flag": 3,
            "sign": decode.e(input_string),  
            "token": self.token
        }

        response = self.session.post(self.url_trans, data)
        response_dict = response.json()
        return response_dict['dict_result']

if __name__ == "__main__":
    api = BaiduTransAPI()
    print(api.trans('word'))
