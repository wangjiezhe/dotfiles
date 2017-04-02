#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userprofile=$HOME/.xprofile
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
sysprofile=/etc/xprofile

# merge in defaults and keymaps
if [ -f "$sysresources" ]; then
        xrdb -merge "$sysresources"
fi
if [ -f "$sysmodmap" ]; then
        xmodmap "$sysmodmap"
fi
if [ -f "$userresources" ]; then
        xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
        xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ]; then
        for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#xrandr --dpi 96
#export VDPAU_DRIVER=nvidia
#export LIBVA_DRIVER_NAME=nvidia

if [ -f "$sysprofile" ]; then
	source "$sysprofile"
fi

if [ -f "$userprofile" ]; then
	source "$userprofile"
fi

exec awesome
# exec /usr/bin/dbus-launch --auto-syntax --exit-with-session awesome
