use std::env;
use std::fs::{self, File};
use std::io::{self, BufRead, BufReader, Write};

fn main() -> io::Result<()> {
    // Получаем аргумент командной строки - имя файла
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("Usage: {} <filename>", args[0]);
        std::process::exit(1);
    }
    let filename = &args[1];

    // Открываем файл для чтения
    let file_in = File::open(filename)?;
    let reader = BufReader::new(file_in);

    // Создаем временный файл для записи
    let temp_filename = format!("{}.tmp", filename);
    let file_out = File::create(&temp_filename)?;

    // Создаем итератор, пропускающий первую строку
    let mut lines_iter = reader.lines();
    lines_iter.next(); // Пропускаем первую строку

    // Записываем оставшиеся строки во временный файл
    let mut writer = io::BufWriter::new(file_out);
    for line in lines_iter {
        let line = line?;
        writeln!(&mut writer, "{}", line)?;
    }

    // Закрываем временный файл
    writer.flush()?;
    drop(writer);

    // Удаляем исходный файл
    fs::remove_file(filename)?;

    // Переименовываем временный файл в исходное имя файла
    fs::rename(&temp_filename, filename)?;

    println!("First line removed from file.");

    Ok(())
}
