#!/usr/bin/env bash
[[ $# -eq 0 ]] && echo "No pdf supplied.." || atril $1 > /dev/null 2>&1 &
