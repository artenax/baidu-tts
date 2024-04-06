def insert_newlines(input_file):
    with open(input_file, 'r') as file:
        lines = file.readlines()

    with open(input_file, 'w') as file:
        for line in lines:
            while len(line) > 300:
                # Найти индекс точки и пробела перед ней
                index = line.rfind('. ', 0, 300)
                if index == -1:  # Если не найдено точку и пробел в пределах 300 символов
                    break
                # Вставить перенос строки после точки
                line = line[:index + 1] + '\n' + line[index + 2:]
            # Удалить пробел в начале новой строки
            line = line.lstrip()
            file.write(line)

if __name__ == "__main__":
    input_file = "input.txt"
    insert_newlines(input_file)
