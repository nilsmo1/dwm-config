#!/usr/bin/env bash
[[ $# -eq 0 ]] && exit || man $1 > /dev/null 2>&1 && man -Tpdf $1 | zathura -
