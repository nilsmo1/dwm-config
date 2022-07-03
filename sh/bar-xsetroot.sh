#!/usr/bin/env bash
bat=$(cat /sys/class/power_supply/BAT0/capacity)
bat_icon=$(echo -e "\uf244 \uf243 \uf242 \uf241 \uf240 \uf240" | awk -v i=$(expr 1 + $bat / 20) '{print $i}')
charging=$(cat /sys/class/power_supply/BAT0/status)
c_bat=$(echo -e "\uf0e7") 
date_time=$(date -u +'%A ┃ %-d/%-m (%B %-d) ┃ %R ')
connection=$(netctl list | awk '/^\*/{for (i=2; i<=NF; i++) printf $i " ";}')
[[ $charging = "Charging" ]] && bat_full="$c_bat ($bat%)" || bat_full="$bat_icon ($bat%)"
[[ $connection ]] && connection="$(echo -e "\uf1eb") $connection┃"
xsetroot -name "$connection $bat_full ┃ $date_time" 
