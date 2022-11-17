#!/usr/bin/env bash
#notify-send "$(manga-redirector.sh "$@")"      (for ulauncher)
cd ~/Documents/code/python/manga-redirector/
for i in "$@"; do 
    if [[ $i == "--help" || $i == "-h" ]];
    then
       python3 main.py "$@" && exit 1
    fi
done
python3 main.py "$@" > /dev/null 2>&1 &
