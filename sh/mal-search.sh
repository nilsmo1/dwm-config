#!/usr/bin/env bash
[[ $# -eq 0 ]] && echo "No url supplied.." && exit 1
url="https://myanimelist.net/search/all?q="; url_end="&cat=all"; join="%20"; query="$1"
for word in ${@:2}; do query+="$join$word"; done
xdg-open "$url$query$url_end" > /dev/null 2>&1 && exit 0
