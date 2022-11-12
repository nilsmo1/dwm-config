#!/usr/bin/env bash
file=$(basename -- $1)
name=${file%.*}
if ps ax | grep -v grep | grep "zathura $name.pdf" > /dev/null 2>&1
then 
    kill $(pidof -x zathura $name.pdf)
fi
pdflatex $file > /dev/null 2>&1 && rm $name.log $name.aux $name.out && zathura $name.pdf > /dev/null 2>&1 &
