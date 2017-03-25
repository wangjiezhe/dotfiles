# ~/.zprofile

figlet -f slant Arch Linux | lolcat
# bash -c 'fortune | ponythink'
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'  # on, lcd, gsap, etc.
# export _JAVA_AWT_WM_NONREPARENTING=1  # for awesome is a non-reparenting wm.
# export _JAVA_OPTIONS='-Djava.net.preferIPv6Addresses=true -Djava.net.preferIPv4Stack=false'
#export XDG_RUNTIME_DIR=/run/user/$UID
#export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
