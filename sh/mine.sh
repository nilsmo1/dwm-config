#!/usr/bin/env bash
clear; 
minesweeper && echo "play again? [Y/n]" && read ans
pat="^[yY]"
if [[ $ans == "" || $ans =~ $pat ]]
then
	mine.sh
fi
