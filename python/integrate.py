import os
import sys
import re
import csv


def main():
    # 所有 csv 文件
    files = [f for f in os.listdir('.') if os.path.isfile(f) and re.search('\\.csv$', f, re.IGNORECASE)]
    # 所有结构表
    book_files = list(filter(lambda x: re.search('__book\\.csv$', x, re.IGNORECASE), files))
    # 所有单词表
    voc_files = list(filter(lambda x: re.search('__voc\\.csv$', x, re.IGNORECASE), files))

    # 结构表和单词表个数是否一样
    if len(book_files) != len(voc_files):
        print('FILES DOES NOT MATCHED.')
        sys.exit()

    # 事先清理结果文件
    if os.path.isfile('result.csv'):
        os.remove('result.csv')

    # 打开结果文件句构，以便写入
    with open('result.csv', 'w', newline='', encoding='utf-8') as csv_file:
        fieldnames = [
            'book_entry', 'voc_entry', 'book_name', 'stage', 'unit', 'entry', 'definition',
            'ame_spelling', 'bre_spelling', 'abbr', 'full_form', 'synonyms', 'antonyms', 'usages'
        ]
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        writer.writeheader()

        # 遍历结构表
        for book_file in book_files:
            print(book_file)
            book_name = re.sub(r'__book.csv', '', book_file)

            book_file_lines = []
            voc_file_lines = []

            with open(book_file,  newline='', encoding='utf-8-sig') as book_csv:
                book_csv_reader = csv.DictReader(book_csv)
                for book_file_line in book_csv_reader:
                    if not is_empty_dict(book_file_line) and not book_file_line['单词名称'] == '':
                        # print(book_file_line)
                        book_file_lines.append(book_file_line)

                voc_file = re.sub(r'__book.csv', '__voc.csv', book_file)
                if os.path.isfile(voc_file):
                    with open(voc_file, newline='', encoding='utf-8-sig') as voc_csv:
                        voc_csv_reader = csv.DictReader(voc_csv)
                        for voc_file_line in voc_csv_reader:
                            if not is_empty_dict(voc_file_line):
                                # print(voc_file_line)
                                voc_file_lines.append(voc_file_line)

            # 结构表和单词表行数一致时
            if len(book_file_lines) and len(book_file_lines) == len(voc_file_lines):
                for i in range(len(book_file_lines)):
                    book_file_dict = book_file_lines[i]
                    # print(book_file_dict)
                    voc_file_dict = voc_file_lines[i]
                    # print(voc_file_dict)

                    res = {
                        'book_entry': book_file_dict['单词名称'],
                        'voc_entry': voc_file_dict['单词名称'],
                        'book_name': book_name,
                        'stage': '小学',
                        'unit': book_file_dict['单元'],
                        'entry': voc_file_dict['单词名称'],
                        'definition': voc_file_dict['词义'],
                        'ame_spelling': voc_file_dict['美式拼写'],
                        'bre_spelling': voc_file_dict['英式拼写'],
                        'abbr': voc_file_dict['缩写'],
                        'full_form': voc_file_dict['全写'],
                        'synonyms': voc_file_dict['近义词'],
                        'antonyms': voc_file_dict['反义词'],
                        'usages': voc_file_dict['常见用法']
                    }

                    if re.search('初中', res['book_name']):
                        res['stage'] = '初中'
                    elif re.search('高中', res['book_name']):
                        res['stage'] = '高中'

                    for k in res.keys():
                        res[k] = strip_field(res[k])

                    writer.writerow(res)


def is_empty_dict(line_dict):
    if isinstance(line_dict, dict):
        for key in line_dict.keys():
            if line_dict[key]:
                return False
    return True


def strip_field(field):
    field = re.sub('^\\s*', '', field)
    return re.sub('\\s*$', '', field)


if __name__ == '__main__':
    main()
