from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
import re
import time

svc = Service(r"C:\chromedriver.exe")
driver = webdriver.Chrome(service=svc)

base_url = 'http://rank.cn-healthcare.com/rank/profession-reputation-best'

years = list(range(2019, 2009, -1))
print(years)

subjects = {
    2: '病理科',
    3: '传染感染',
    4: '耳鼻喉科',
    5: '放射科',
    6: '呼吸科',
    7: '风湿科',
    8: '妇产科',
    9: '骨科',
    10: '精神医学',
    11: '口腔科',
    12: '麻醉科',
    13: '泌尿外科',
    14: '内分泌',
    15: '皮肤科',
    16: '普通外科',
    17: '神经内科',
    18: '肾脏病',
    19: '神经外科',
    20: '消化病',
    21: '小儿内科',
    22: '小儿外科',
    23: '心血管病',
    24: '心外科',
    25: '胸外科',
    26: '血液科',
    27: '眼科',
    28: '整形外科',
    29: '肿瘤科',
    30: '老年医学',
    31: '康复医学',
    32: '检验医学',
    33: '烧伤科',
    34: '核医学',
    35: '超声医学',
    36: '急诊医学',
    37: '重症医学',
    38: '临床药学',
    39: '健康管理',
    40: '变态反应',
    41: '生殖医学'
}

# print(list(subjects.keys()))

for year in years:
    for subject_id in list(subjects.keys()):
        url = base_url + '/' + str(subject_id) + '/' + str(year)
        # print(url)

        driver.get(url)
        time.sleep(2)
        html = driver.page_source
        soup = BeautifulSoup(html, 'html.parser')

        rank_items = soup.select('#rank_body tr[class!=getTm]')
        mentioned_items = soup.select('#rank_body tr[class=getTm] span')

        for item in rank_items:
            rank = {
                'year': year,
                'category': item.get('category') or '',
                'city': item.get('city') or '',
                'hosid': item.get('hosid') or '',
                'hosname': item.get('hosname') or '',
                'region': item.get('region') or '',
                'subject_id': subject_id,
                'subject': subjects[subject_id]
            }

            # print(rank)

            item_str = str(item)
            item_str = re.sub(r"<img.*?>", '', item_str)
            item_str = re.sub(r"\n", '', item_str)
            item_str = re.sub(r"<tr .*?>", '<tr>', item_str)
            item_str = re.sub(r"<th .*?>", '<th>', item_str)
            item_str = re.sub(r"<td .*?>", '<td>', item_str)
            item_str = re.sub(r"</?a( .*?)?>", '', item_str)
            item_str = re.sub(r"<span class=\"number-ranking col-md-6.*?\">(\d+)</span>", '\\1', item_str)
            item_str = re.sub(r"\s*<span class=\"arrow-ranking arrow-top.*?\"></span>", '↑', item_str)
            item_str = re.sub(r"\s*<span class=\"arrow-ranking arrow-down.*?\"></span>", '↓', item_str)

            # print(item_str)

            if m := re.match(r".*?<th>.*?<!--\s*(\d+)\s*--></th><td>[^<]+</td><td>([^<]+)</td><td>([^<]+)</td><td>([^<]+)</td><td>([^<]+)</td>.*?", item_str):
                rank['rank'] = m.group(1)
                rank['score'] = m.group(4)
                rank['change'] = m.group(5)

            print(year, "\t", rank['subject_id'], "\t", rank['subject'], "\t", rank['hosid'], "\t", rank['hosname'], "\t", rank['region'], "\t", rank['city'], "\t", rank['category'], "\t", rank['score'], "\t", rank['rank'], "\t", rank['change'])

        for e in mentioned_items:
            print(year, "\t", rank['subject_id'], "\t", rank['subject'], "\t", "", "\t", e.contents[0])

driver.close()
