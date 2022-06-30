#!/usr/bin/env bash
bat=$(cat /sys/class/power_supply/BAT0/capacity)
date_time=$(date -u +'%A | %d/%m (%B %d) | %R ')
xsetroot -name "$bat% | $date_time"
