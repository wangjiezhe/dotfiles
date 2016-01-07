#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

setxkbmap -option ctrl:swapcaps
setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -option altwin:meta_alt
#setxkbmap -option altwin:meta_win

# export GTK_IM_MODULE="ibus"
# export QT_IM_MODULE="ibus"
# export XMODIFIERS="@im=ibus"
# ibus-daemon -x -d &
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"
fcitx -D &
# fcitx-qimpanel &

hsetroot -solid '#000000' &
compton -b

# xscreensaver -nosplash &

syndaemon -t -k -i 2 -d
# -R

# unlock keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export SSH_AUTH_SOCK

# start clipboard
clipit &
# parcellite &

# bluetooth
# blueman-applet &

# transmission
transmission-gtk -m &

# shutter
#shutter --min_at_startup &

# automount
pkttyagent &
udiskie &
devmon &
pcmanfm -d &

# conky
start-conky &

# vim
# vim +q
# urxvtc -e 'vim +q'
mkdir -p /tmp/vim_undodir

# start terminal at autostart
urxvtd -q -f -o
urxvtc

# start pulseaudio and system tray for it
start-pulseaudio-x11
pasystray &

# emacs
emacs --daemon

exec awesome
# exec /usr/bin/dbus-launch --auto-syntax --exit-with-session awesome
