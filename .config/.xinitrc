#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Keyboard layout
setxkbmap sv-latin1 &

# Nitrogen
nitrogen --restore &

# Betterlockscreen
#betterlockscreen -l dimblur -t &

# Picom
picom --config ~/.config/picom/picom.conf -f &

# Show time in status
while true; do
    bar-xsetroot.sh || echo 'hello'
    sleep 10s
done &
# Loop
while true; do
	dwm >/dev/null 2>&1
done

# Execute DWM
exec dwm

