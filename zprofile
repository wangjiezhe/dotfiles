# ~/.zprofile

figlet -f slant Arch Linux | lolcat
# bash -c 'fortune | ponythink'
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'  # on, lcd, gsap, etc.
export _JAVA_AWT_WM_NONREPARENTING=1  # for awesome is a non-reparenting wm.
# export _JAVA_OPTIONS='-Djava.net.preferIPv6Addresses=true -Djava.net.preferIPv4Stack=false'
#if [[ -z $XDG_RUNTIME_DIR ]]; then
#	echo
#	echo "Set parameters manually..."
#	export XDG_RUNTIME_DIR=/run/user/$UID
#	export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus
#fi
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
