import os
import re
import csv


def main():
    result_file_path = '趣记忆单词v2_释义全表v4.csv'
    if os.path.isfile(result_file_path):
        os.remove(result_file_path)

    with open('趣记忆单词v2_释义全表v3.csv', newline='', encoding='utf-8') as csv_data:
        csv_reader = csv.DictReader(csv_data)

        with open(result_file_path, 'w', newline='', encoding='utf-8') as csv_res_file:
            fieldnames = [
                'no', 'book_entry', 'voc_entry', 'equal', 'book_name', 'stage', 'unit', 'entry', 'definition',
                'pos', 'ame_spelling', 'bre_spelling', 'abbr', 'full_form', 'synonyms', 'antonyms', 'usages'
            ]
            csv_writer = csv.DictWriter(csv_res_file, fieldnames=fieldnames)
            csv_writer.writeheader()

            for row in csv_reader:
                row['pos'] = collect_pos(row['definition'])
                # print(row)
                csv_writer.writerow(row)


def collect_pos(definition):
    if definition is None:
        return None

    matched_pos = re.findall(r'([a-z]+\.( [a-z]+\.)?)|(modal v\.)', definition)
    pos = ''
    if len(matched_pos):
        matched_pos = list(map(lambda x: x[0], matched_pos))
        pos = ', '.join(matched_pos)

    return pos


if __name__ == '__main__':
    main()
