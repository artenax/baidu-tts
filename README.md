# baidu-tts

**Больше не работает. Baidu теперь требует регистрацию, чтобы насладиться аутентичным произношением, а за пределами Китая это очень сложно. Российские, а возможно и некитайские телефонные номера не принимаются. Вот, что бывает, когда вы полагаетесь на онлайн, особенно в таких авторитарных странах, как Китай. Это проект останется как пример кода. Но я не советую вам полагаться на онлайн, вы понимаете почему.**

**Doesn't work anymore. Baidu now requires registration to enjoy authentic pronunciation, but outside of China it's very difficult. Russian and possibly non-Chinese phone numbers are not accepted. This is what happens when you rely on online, especially in authoritarian countries like China. This project will remain as a code example. But I don't advise you to rely on online, you can see why.**

Текст разбивается автоматически по переносам строк.   
Но длинные строки всё ещё нужно обрезать самому. Пока что замечено, что сервер принимает по крайней мере 413 символов в строке.   

Fix 1: Чтобы избавиться от длинных строк добавил перенос строк после каждого предложения. Это привело к лишним паузам в звуке.   
Исправил переименование. Теперь python выполняет правильную естественную сортировку после wget.   

Fix 2: Перенос строк после каждого предложения убрал. Добавил частичное сокращение длинных строк python скриптом. Неисправленное надо сокращать самому.   

Fix 3: Добавил удаление пауз с помощью ffmpeg, автоповтор в wget.   

Fix 4: Оказывается, wget при реконнектах не слушается опции --content-disposition и сохраняет с неправильным именем файла, который потом склеивается не по порядку. Изменил алгоритм именования файлов в replace.py на добавление временной метки UNIX. Неудобство в том, что за процессом скачивания теперь стало неудобно следить. Разве что мониторить папку /tmp/audio/mp3   
AI подсказал более удобный код отправки текстовых URL в wget через список файлов list.txt. См. файл wget-1.sh. Но придётся много переделывать и я пока его не использую.   
При sleep 4 на запрос одной строки тратится примерно 6,5 секунд.   

# Использование
Поместите файлы cut.py, replace.py, rename.py, file.py и baidu-tts.sh в одну папку. Выполните   
python3 /home/denis/ui/file.py (можно создать .desktop ярлык с такой командой, не забудьте добавить Terminal=true)   
и откройте txt файл с книгой.   
Убедитесь, что file.py содержит правильный путь к файлу baidu-tts.sh и во всех файлах правильные пути.   
mousepad и adie - текстовые редакторы по вкусу. В них нужно убедиться, что нет строк длиннее 413 символов.   
Установите зависимости: ffmpeg, mkvtoolnix, mediainfo, python3-gi, python3-regex.   
Для упрощения запуска сделал [deb и rpm](https://github.com/artenax/baidu-tts/releases/tag/v1.1) пакеты.   

baidu-tts.sh предназначен для преобразования txt книг в звук.   
baidu-translator (ему нужен python3-tk) для озвучивания небольших текстов из окошка. Он запускается так: python3 /home/denis/ui/baidu-translator.py   
Ему нужны файлы cut.py, replace2.py и rename2.py. А также плеер vlc.   
Убедитесь в правильности путей. У меня все лежит в /home/denis/ui   
Для запуска baidu-translator также можно воспользоваться [релизным бинарником](https://github.com/artenax/baidu-tts/releases/tag/v1.0).   

Replacing ru with en allows you to use English. And specifying a different URL - a different service.
