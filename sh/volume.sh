#!/usr/bin/env bash
read -r min_master_volume max_master_volume < <(amixer sget Master | awk '/Limits/{print $3,$5}')
current_master_volume=$(amixer sget Master | awk '/Mono:/{print $3}')
muted_master=$(amixer sget Master | awk '/Mono:/{print $6}')
case $1 in 
    'mute') case $muted_master in
        '[off]') amixer -q sset Master toggle; amixer -q sset Speaker toggle; amixer -q sset Headphone toggle ;;
        '[on]' ) amixer -q sset Master toggle ;;
         *     ) ;;
        esac ;;
    'inc' ) [ $current_master_volume -ne $max_master_volume ] && amixer -q sset Master 2+   ;;
    'dec' ) [ $current_master_volume -ne $min_master_volume ] && amixer -q sset Master '2-' ;;
     *    ) ;;
esac
