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
LD_LIBRARY_PATH=/home/denis/software/adie /home/denis/software/adie/adie input.txt
sed -i '1s/^/SCRIPT\n/' input.txt
echo "END" >> input.txt
#echo "Пожалуйста, отредактируй команды автозамены в Adie, потому что в консольном sed это слишком сложно"
#echo "Прокрути колёсико вверх над полем искать в"
#LD_LIBRARY_PATH=/home/denis/software/adie /home/denis/software/adie/adie input.txt
/usr/bin/python3 /home/denis/ui/replace.py
sed -i '1d' input.txt
sed -i '$d' input.txt
sed -i '$d' input.txt
#LD_LIBRARY_PATH=/home/denis/software/adie /home/denis/software/adie/adie input.txt
mv input.txt input.sh
chmod +x input.sh
mkdir -p mp3
cd mp3
bash ../input.sh
rename 'our $i; $i++; $_ = sprintf("%03d", $i)' *
echo "СПИСОК АУДИО ФАЙЛОВ"
ls
cat * > ../audio.mp3
#cat 001 002 003 004 005 006 007 008 009 010 011 012 > ../audio.mp3 2> /dev/null
cd ..
rm -rdf /tmp/audio/mp3
/usr/bin/ffmpeg -i audio.mp3 -c:a copy -vn -sn -map_metadata -1 audio-fix.mp3
rm -f audio.mp3
/usr/bin/mkvmerge --output audio-fix.mka audio-fix.mp3
rm -f audio-fix.mp3
/usr/bin/mkvextract tracks audio-fix.mka 0:audio.mp3
rm -f audio-fix.mka
/usr/bin/mediainfo audio.mp3
cp -f /tmp/audio/audio.mp3 '/home/denis/Рабочий стол/audio.mp3'
cp -f /tmp/audio/input.sh '/home/denis/Рабочий стол/input.txt'
chmod -x '/home/denis/Рабочий стол/input.txt'
cd /home/denis
rm -rdf /tmp/audio
echo Done
