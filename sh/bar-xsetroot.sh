#!/usr/bin/env bash
bat=$(cat /sys/class/power_supply/BAT0/capacity)
bat_icon=$(echo -e "\uf244 \uf243 \uf242 \uf241 \uf240" | awk -v i=$(expr 1 + $bat / 20) '{print $i}')
charging=$(cat /sys/class/power_supply/BAT0/status)
c_bat=$(echo -e "\uf0e7") 
date_time=$(date -u +'%A ┃ %-d/%-m (%B %-d) ┃ %R ')
connection=$(netctl list | awk '/^\*/{for (i=2; i<=NF; i++) printf $i " ";}')
[[ $charging = "Charging" ]] && out="$c_bat $bat% ┃ $date_time" || out="$bat_icon $bat% ┃ $date_time"
[[ $connection ]] && connection="$(echo -e "\uf1eb") $connection┃"
xsetroot -name "$connection $out" 
