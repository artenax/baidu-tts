#!/bin/bash
cd /tmp
rm -f /tmp/input.sh
rm -f /tmp/audio.mp3
rm -f /tmp/audio.mka
rm -rdf /tmp/audio
echo "Заменяем кавычки и тире"
sed -i 's|'\''|`|g' input.txt
sed -i 's|"|“|g' input.txt
sed -i 's|–|—|g' input.txt
sed -i 's|‒|—|g' input.txt
echo "" >> input.txt # добавляем перенос строки в конец файла на случай если его там нет
echo "Частично сокращаем длинные строки"
/usr/bin/python3 /home/denis/ui/cut.py
/usr/bin/python3 /home/denis/ui/cut.py
sed -i 's/\.\ /.\n/g' input.txt # вставляем перенос строки после каждого предложения для сокращения длины строки
sed -i 's/  / /g' input.txt # удаляем лишние пробелы
sed -i 's/  / /g' input.txt # удаляем лишние пробелы
sed -i 's/  / /g' input.txt # удаляем лишние пробелы
sed -i ':a;N;$!ba;s/\n\n/\n/g' input.txt # удаляем пустые строки
sed -i ':a;N;$!ba;s/\n\n/\n/g' input.txt # удаляем пустые строки
sed -i ':a;N;$!ba;s/\n\n/\n/g' input.txt # удаляем пустые строки
sed -i '1s/^/SCRIPT\n/' input.txt # пишем SCRIPT в начало файла
echo "END" >> input.txt # пишем END в конец файла
/usr/bin/python3 /home/denis/ui/replace2.py
sed -i '1d' input.txt # удаляем первую строку
sed -i '$d' input.txt # удаляем последнюю строку
sed -i '$d' input.txt # удаляем последнюю строку
mv input.txt input.sh
chmod +x input.sh
mkdir -p audio
cd audio
bash ../input.sh
/usr/bin/python3 /home/denis/ui/rename2.py
cat * > ../audio.mp3
cd ..
ffmpeg -threads 1 -i audio.mp3 -threads 1 -af silenceremove=start_periods=1:stop_periods=-1:start_threshold=-40dB:stop_threshold=-40dB:start_silence=0.5:stop_silence=0.5 -acodec flac -sample_fmt s16 -compression_level 1 -ac 2 -ar 48000 -y audio.mka
rm -f /tmp/input.txt
rm -f /tmp/input.sh
rm -f /tmp/audio.mp3
rm -rdf /tmp/audio
vlc /tmp/audio.mka
rm -f /tmp/audio.mka
