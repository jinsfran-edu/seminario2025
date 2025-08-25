import os
import re

def split_insert_values(insert_stmt, max_values=1000):
    insert_pattern = re.compile(r'(INSERT INTO .*? VALUES\s+)\n+(.*?);', re.IGNORECASE | re.DOTALL)
    match = insert_pattern.match(insert_stmt)
    if not match:
        return [insert_stmt]
    prefix, values_str = match.groups()
    values = re.findall(r'\([^\)]*\)', values_str)
    result = []
    for i in range(0, len(values), max_values):
        chunk = values[i:i+max_values]
        new_stmt = prefix + '\n' + ',\n'.join(chunk) + ';\nGO'
        result.append(new_stmt)
    return result


def process_sql_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    insert_pattern = re.compile(r'(INSERT INTO .*? VALUES\s+)\n+(.*?);', re.IGNORECASE | re.DOTALL)
    new_content = content
    for match in insert_pattern.finditer(content):
        insert_stmt = match.group()
        split_stmts = split_insert_values(insert_stmt)
        new_content = new_content.replace(insert_stmt, '\n'.join(split_stmts))
    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)

def main():
    os.chdir('Data')
    for filename in os.listdir('.'):
        if filename.lower().endswith('.sql'):
            print(f'Procesando {filename}...')
            process_sql_file(filename)
    os.chdir('..')

if __name__ == '__main__':
    main()