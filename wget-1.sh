#!/bin/bash

input="list.txt"
i=1

while IFS= read -r url; do
    output="tts.mp3.$i"
    while [ -e "$output" ]; do
        output="tts.mp3.$((i++))"
    done
    wget --retry-on-http-error=503 --waitretry=10 --retry-connrefused -t 10 --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" --content-disposition -O "$output" "$url"
    ((i++))
    sleep 4
done < "$input"
