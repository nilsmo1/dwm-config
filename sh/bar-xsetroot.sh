#!/usr/bin/env bash
bat=$(cat /sys/class/power_supply/BAT0/capacity)
charging=$(cat /sys/class/power_supply/BAT0/status)
date_time=$(date -u +'%A | %d/%m (%B %d) | %R ')
[[ $charging = "Charging" ]] && out="$bat% (charging) | $date_time" || out="$bat% | $date_time"
xsetroot -name "$out" 
