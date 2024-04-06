#!/bin/bash
rm -rdf /tmp/audio
mkdir -p /tmp/audio
cp -f "$1" /tmp/audio/input.txt
#cp -f '/media/denis/Data/Files/Архив/Audio books/Кот в мешке/01.txt' /tmp/audio/input.txt
cd /tmp/audio
sed -i 's|'\''|`|g' input.txt
sed -i 's|"|“|g' input.txt
sed -i 's|–|—|g' input.txt
sed -i 's|‒|—|g' input.txt
#sed -i 's/.../…/g' input.txt # плохая замена используй вручную
echo "Частично сокращаем длинные строки"
/usr/bin/python3 /home/denis/ui/cut.py
/usr/bin/python3 /home/denis/ui/cut.py
sed -i 's/  / /g' input.txt # удаляем лишние пробелы
sed -i 's/  / /g' input.txt # удаляем лишние пробелы
sed -i 's/  / /g' input.txt # удаляем лишние пробелы
#sed -i 's/\.\ /.\n/g' input.txt # вставляем перенос строки после каждого предложения для сокращения длины строки
sed -i ':a;N;$!ba;s/\n\n/\n/g' input.txt # удаляем пустые строки
sed -i ':a;N;$!ba;s/\n\n/\n/g' input.txt # удаляем пустые строки
echo "Убедись, что нет строк длиннее 413 символов"
mousepad input.txt
#LD_LIBRARY_PATH=/home/denis/software/adie /home/denis/software/adie/adie input.txt
sed -i '1s/^/SCRIPT\n/' input.txt # пишем SCRIPT в начало файла
echo "END" >> input.txt # пишем END в конец файла
/usr/bin/python3 /home/denis/ui/replace.py
/home/denis/ui/apps/rfl
#sed -i '1d' input.txt # удаляем первую строку в качестве эксперимента rfl утилита используется для этого
/home/denis/ui/apps/rll
/home/denis/ui/apps/rll
#sed -i '$d' input.txt # удаляем последнюю строку rll утилита используется для этого
#sed -i '$d' input.txt # удаляем последнюю строку rll утилита используется для этого
mv input.txt input.sh
chmod +x input.sh
echo "Проверяем финальный код"
LD_LIBRARY_PATH=/home/denis/software/adie /home/denis/software/adie/adie input.sh
mkdir -p mp3
cd mp3
bash ../input.sh
#rename 'our $i; $i++; $_ = sprintf("%04d", $i)' * # плохая неестественная сортировка
/usr/bin/python3 /home/denis/ui/rename.py
echo "СПИСОК АУДИО ФАЙЛОВ"
ls
cat * > ../audio.mp3
#cat tts.mp3 tts.mp3.1 tts.mp3.2 tts.mp3.3 tts.mp3.4 tts.mp3.5 tts.mp3.6 tts.mp3.7 tts.mp3.8 tts.mp3.9 tts.mp3.10 tts.mp3.11 tts.mp3.12 tts.mp3.13 tts.mp3.14 tts.mp3.15 tts.mp3.16 tts.mp3.17 tts.mp3.18 tts.mp3.19 tts.mp3.20 tts.mp3.21 tts.mp3.22 tts.mp3.23 > ../audio.mp3 2> /dev/null
cd ..
#rm -rdf /tmp/audio/mp3
/usr/bin/ffmpeg -i audio.mp3 -c:a copy -vn -sn -map_metadata -1 audio-fix.mp3
rm -f audio.mp3
/usr/bin/mkvmerge --output audio-fix.mka audio-fix.mp3
rm -f audio-fix.mp3
/usr/bin/mkvextract tracks audio-fix.mka 0:audio.mp3
rm -f audio-fix.mka
/usr/bin/mediainfo audio.mp3
ffmpeg -threads 1 -i audio.mp3 -threads 1 -af silenceremove=start_periods=1:stop_periods=-1:start_threshold=-40dB:stop_threshold=-40dB:start_silence=0.7:stop_silence=0.7 -acodec flac -sample_fmt s16 -compression_level 0 -y audio.mka
/usr/bin/mediainfo audio.mka
cp -f /tmp/audio/audio.mka '/home/denis/Рабочий стол/audio.mka'
cp -f /tmp/audio/input.sh '/home/denis/Рабочий стол/input.txt'
chmod -x '/home/denis/Рабочий стол/input.txt'
cd /home/denis
#rm -rdf /tmp/audio
du /tmp/audio/mp3/*
echo Done
