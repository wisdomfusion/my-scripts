import os
import re
import csv


def main():
    if os.path.isfile('data_v1.csv'):
        os.remove('data_v1.csv')

    with open('data.csv', newline='', encoding='utf-8-sig') as csv_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')

        with open('data_v1.csv', 'w', newline='', encoding='utf-8') as csv_res_file:
            csv_writer = csv.writer(csv_res_file, delimiter='\t')
            # csv_writer.writeheader()
            csv_writer.writerow([
                'no.', 'book_entry', 'voc_entry', 'equal?', 'book_name', 'stage',
                'unit', 'entry', 'definition', '(main) pos',
                'ame_spelling', 'bre_spelling', 'abbr', 'full_form',
                'synonyms', 'antonyms', 'usages'
            ])

            for row in csv_reader:
                row['book_entry'] = trim_spelling(row['book_entry'])
                row['voc_entry'] = trim_spelling(row['voc_entry'])
                row['definition'] = trim_definition(row['definition'])

                csv_writer.writerow([
                    row['no.'], row['book_entry'], row['voc_entry'], row['equal?'], row['book_name'], row['stage'],
                    row['unit'], row['entry'], row['definition'], row['(main) pos'],
                    row['ame_spelling'], row['bre_spelling'], row['abbr'], row['full_form'],
                    row['synonyms'], row['antonyms'], row['usages']
                ])


def trim_spelling(spelling):
    spelling = re.sub('…', ' ... ', spelling)
    spelling = re.sub('\\s*\\.{4,}\\s*', ' ... ', spelling)
    spelling = re.sub('\\s+', ' ', spelling)
    spelling = re.sub('([a-z])\\(', '\\1(', spelling)
    spelling = re.sub('\\s+$', '', spelling)
    spelling = re.sub('^\\s+', '', spelling)
    spelling = re.sub('！', '!', spelling)
    spelling = re.sub('？', '?', spelling)
    spelling = re.sub('[‘’ˈ`]', '\'', spelling)
    spelling = re.sub('（', '(', spelling)
    spelling = re.sub('）', ')', spelling)
    spelling = re.sub('[，,]\\s*', ', ', spelling)
    spelling = re.sub('／', '/', spelling)
    spelling = re.sub('ﬂ', 'fl', spelling)
    spelling = re.sub('\\s+([?!])$', '\\1', spelling)

    return spelling


def trim_definition(definition):
    definition = re.sub('…', '……', definition)
    definition = re.sub('…+', '……', definition)
    definition = re.sub(',', '，', definition)
    definition = re.sub(';', '；', definition)
    definition = re.sub('([a-z]+[.．])', '\\1 ', definition)
    definition = re.sub('([a-z]+[.．])\\s*[&＆]\\s*([a-z]+[.．])\\s*[&＆]\\s*([a-z]+[.．])', '\\1&\\2&\\3', definition)
    definition = re.sub('([a-z]+[.．])\\s*[&＆]\\s*([a-z]+[.．])', '\\1&\\2', definition)
    definition = re.sub('([a-z]+[.．])\\s*[/／]\\s*([a-z]+[.．])', '', definition)
    definition = re.sub('\\s+', ' ', definition)
    definition = re.sub('\\s+$', '', definition)
    definition = re.sub('^\\s+', '', definition)

    return definition


if __name__ == '__main__':
    main()
