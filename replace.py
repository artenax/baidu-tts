import re

# Чтение содержимого файла
filename = 'input.txt'
with open(filename, 'r', encoding='utf-8') as file:
    content = file.read()

# Выполнение замены
pattern = r'\n'
replacement = '"\\nsleep 3 && wget --user-agent=\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36\" --content-disposition \"https://fanyi.baidu.com/gettts?spd=3&source=web&lan=ru&text='
modified_content = re.sub(pattern, replacement, content)

# Запись измененного содержимого обратно в файл
with open(filename, 'w', encoding='utf-8') as file:
    file.write(modified_content)
