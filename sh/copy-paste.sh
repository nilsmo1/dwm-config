#!/usr/bin/env bash
[ $# -eq 0 ] && xclip -selection c -o || xclip -selection c $1 
