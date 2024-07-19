import re

# Чтение содержимого файла
filename = 'input.txt'
with open(filename, 'r', encoding='utf-8') as file:
    content = file.read()

# Выполнение замены
pattern = r'\n'
replacement = '"\\nsleep 4 && wget -e use_proxy=yes -e https_proxy=127.0.0.1:2070 --retry-on-http-error=503 --waitretry=10 --retry-connrefused -t 10 --user-agent=\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36\" -O \"tts.mp3.$(date +%s).mp3\" \"https://fanyi.baidu.com/gettts?spd=3&source=web&lan=ru&text='
modified_content = re.sub(pattern, replacement, content)

# Запись измененного содержимого обратно в файл
with open(filename, 'w', encoding='utf-8') as file:
    file.write(modified_content)
