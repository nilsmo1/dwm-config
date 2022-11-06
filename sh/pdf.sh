#!/usr/bin/env bash
[[ $# -eq 0 ]] && echo "No pdf supplied.." || okular $1 > /dev/null 2>&1 &
