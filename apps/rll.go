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

    var lines []string

    // Читаем строки из файла и сохраняем их в слайс lines
    for scanner.Scan() {
        lines = append(lines, scanner.Text())
    }

    // Удаляем последнюю строку (то есть уменьшаем слайс lines на 1)
    if len(lines) > 0 {
        lines = lines[:len(lines)-1]
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
