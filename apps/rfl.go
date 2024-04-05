package main

import (
    "bufio"
    "os"
)

func main() {
    // Открываем файл для чтения и записи
    file, err := os.OpenFile("input.txt", os.O_RDWR, 0644)
    if err != nil {
        panic(err)
    }
    defer file.Close()

    // Создаем сканер для чтения из файла
    scanner := bufio.NewScanner(file)

    // Считываем первую строку (она нам не нужна)
    if scanner.Scan() {
        // Пропускаем первую строку
    }

    // Читаем оставшиеся строки
    var lines []string
    for scanner.Scan() {
        lines = append(lines, scanner.Text())
    }

    // Обрезаем файл до позиции 0
    if err := file.Truncate(0); err != nil {
        panic(err)
    }

    // Перемещаем указатель в начало файла
    if _, err := file.Seek(0, 0); err != nil {
        panic(err)
    }

    // Записываем оставшиеся строки в файл
    writer := bufio.NewWriter(file)
    for _, line := range lines {
        _, err := writer.WriteString(line + "\n")
        if err != nil {
            panic(err)
        }
    }
    writer.Flush()

    if err := scanner.Err(); err != nil {
        panic(err)
    }
}
