#!/usr/bin/env bash
bat=$(cat /sys/class/power_supply/BAT0/capacity)
charging=$(cat /sys/class/power_supply/BAT0/status)

bat_icon=$(echo -e "\uf244 \uf243 \uf242 \uf241 \uf240 \uf240" | awk -v i=$(expr 1 + $bat / 20) '{print $i}')
c_bat_icon=$(echo -e "\uf0e7") 

declare -A vol_icons=( ["off"]=$(echo -e "\uf026") ["on"]=$(echo -e "\uf028") )
vol=$(amixer sget Master | gawk 'match($0, /Mono: Playback.* \[(.*)%\]/, m) {print m[1]}')
vol_s=$(amixer sget Master | gawk 'match($0, /Mono: Playback.* \[(on|off)\]/, m) {print m[1]}')

date_time=$(date +'%A ┃ %-d/%-m (%B %-d) ┃ %R ')
connection=$(nmcli connection show | grep "wifi" | awk '{print $1}')

[[ $charging = "Charging" ]] && bat_full="$c_bat_icon ($bat%)" || bat_full="$bat_icon ($bat%)"
[[ $connection ]] && connection="$(echo -e "\uf1eb") $connection┃"
[[ $vol_s = "on" ]] && vol_out="${vol_icons[$vol_s]} ($vol%)" || vol_out="${vol_icons[$vol_s]}"

xsetroot -name "$connection $vol_out ┃ $bat_full ┃ $date_time" 
