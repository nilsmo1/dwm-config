#!/usr/bin/env bash
read -r primary < <(xrandr | awk '/.* connected primary/{print $1}')
read -r secondary < <(xrandr | awk '/.* connected [0-9+]/{print $1}')
case $1 in 
    'right'  ) xrandr --output $secondary --auto --right-of $primary ;;
    'left'   ) xrandr --output $secondary --auto --left-of  $primary ;;
    'mirror' ) xrandr --output $secondary --auto --same-as  $primary ;;
    'primary') xrandr --output $secondary --primary                  ;;
     *       ) ;;
esac
