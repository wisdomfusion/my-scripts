# -*- coding: utf-8 -*-

import os
import re
import csv


def main():
    result_file_path = 'entry_result.csv'
    if os.path.isfile(result_file_path):
        os.remove(result_file_path)

    with open('entry.csv', newline='', encoding='utf-8-sig') as csv_data:
        csv_reader = csv.DictReader(csv_data)

        with open(result_file_path, 'w', newline='', encoding='utf-8') as csv_res_file:
            fieldnames = ['entry_text', 'entry_type']
            csv_writer = csv.DictWriter(csv_res_file, fieldnames=fieldnames)
            csv_writer.writeheader()

            for row in csv_reader:
                entry = row['entry_text']
                entry_type = get_entry_type(entry)
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


if __name__ == '__main__':
    main()
