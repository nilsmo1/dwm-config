#!/usr/bin/env bash
file=$(basename -- $1)
name=${file%.*}
pdflatex --halt-on-error $file > /dev/null 2>&1 &&
if ! ps ax | grep -v grep | grep "zathura $name.pdf" > /dev/null 2>&1
then
    zathura $name.pdf > /dev/null 2>&1 &
fi || zenity --warning --text "Failed to compile:\n$file" &
