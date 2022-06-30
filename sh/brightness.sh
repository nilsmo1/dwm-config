#!/usr/bin/env bash

# instructions for "intel_backlight":
# (https://wiki.archlinux.org/title/backlight)
# Paste following into "/etc/udev/rules.d/backlight.rules"
#
# RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
# RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
# 
# Then run:
# usermod -a -G examplegroup exampleusername
# 
# Then check that your user is included in the "video" group with:
# groups $username

path="/sys/class/backlight/intel_backlight"
max_b=$(cat $path/max_brightness)
current_b=$(cat $path/brightness)
d_b=100
case $1 in
    'inc' )
        new_b=$(expr $current_b + $d_b)
        [ $new_b -gt $max_b ] && new_b=$current_b ;;
    'dec' ) 
        new_b=$(expr $current_b - $d_b)
        [ $new_b -lt 0 ] && new_b=$current_b ;;
    'max' ) 
        new_b=$max_b ;;
     *    ) new_b=$current_b ;; 
esac
[ $new_b -ne $current_b ] && echo "$new_b" > "$path/brightness"
