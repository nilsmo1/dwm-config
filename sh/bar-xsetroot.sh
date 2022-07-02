#!/usr/bin/env bash
bat=$(cat /sys/class/power_supply/BAT0/capacity)
charging=$(cat /sys/class/power_supply/BAT0/status)
date_time=$(date -u +'%A ┃ %-d/%-m (%B %-d) ┃ %R ')
connection=$(netctl list | awk '/^\*/{for (i=2; i<=NF; i++) printf $i " ";}')
[[ $charging = "Charging" ]] && out="$bat%+ ┃ $date_time" || out="$bat% ┃ $date_time"
[[ $connection ]] && connection="Network: $connection┃"
xsetroot -name "$connection $out" 
