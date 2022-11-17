#!/usr/bin/env bash
cd ~/Documents/code/python/manga-redirector/
for i in "$@"; do 
    if [[ $i == "--help" || $i == "-h" ]];
    then
       python3 main.py "$@" && exit 1
    fi
done
python3 main.py "$@" > /dev/null 2>&1 &
