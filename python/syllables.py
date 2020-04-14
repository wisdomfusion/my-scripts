# -*- coding: utf-8 -*-

import os
import re
import csv


def main():
    result_file_path = '趣记忆单词v2_拼写全表v2_syllables_result.csv'
    if os.path.isfile(result_file_path):
        os.remove(result_file_path)

    with open('趣记忆单词v2_拼写全表v2_syllables.csv', newline='', encoding='utf-8-sig') as csv_data:
        csv_reader = csv.DictReader(csv_data)

        with open(result_file_path, 'w', newline='', encoding='utf-8') as csv_res_file:
            fieldnames = ['no', 'entry', 'entry_type', 'syllables', 'sysllable_count']
            csv_writer = csv.DictWriter(csv_res_file, fieldnames=fieldnames)
            csv_writer.writeheader()

            for row in csv_reader:
                entry = row['entry']
                entry_type = get_entry_type(entry)

                if entry_type == '头词':
                    syllables = get_entry_syllables(entry)
                    syllable_count = count_syllables(syllables)
                    row['syllables'] = syllables
                    row['sysllable_count'] = syllable_count

                row['entry_type'] = entry_type

                csv_writer.writerow(row)
                # print(row)


def get_entry_type(entry):
    entry_type = '单词'

    # 含如下字符为非头词
    if re.search(r'[\s\.\'`‘’?？…,，(（!！/;；℃=]', entry):
        if re.search(r'[?!]', entry):
            entry_type = '句子'
        elif re.search(r'^a\(a?n\)$', entry):
            entry_type = '单词'
        elif re.search(r'^a[/,]an$', entry):
            entry_type = '单词'
        elif re.search(r'^[a-zA-Z]\.[a-zA-Z]\.$', entry):
            entry_type = '单词'
        elif re.search(r'^[a-z]+\'[a-z]$', entry):
            entry_type = '单词'
        elif re.search(r'^[a-zA-Z]$', entry):
            entry_type = '单词'
        elif re.search(r'[A-Z].+\.$', entry):
            entry_type = '句子'
        elif re.search(r'(sb|sth)\.$', entry):
            entry_type = '短语'
        elif re.search(r'\(', entry):
            entry_type = '短语'
        elif re.search(r'\s', entry):
            entry_type = '短语'

    return entry_type


def get_entry_syllables(entry):
    return entry


def count_syllables(syllables):
    return ''


if __name__ == '__main__':
    main()

# 一、头词：
# 1. 连字符： absent-minded    3-D
# 头词特殊情况：
# 1) a(an)     a(n)    a/an    a, an
# 2) A.M.
# 3) a.m.
# 二、非头词：
# 1. 感叹号：Bless you!
# 2. 问号：Are you OK?
# 3. 空格： a slice of flesh
# 4. 省略号：a small amount of ...
# 5. 句号： I have a stomachache.
# 6. 括号：accompany sb. to (a place)
# 7. 15℃
