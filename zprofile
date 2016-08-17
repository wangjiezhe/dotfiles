# ~/.zprofile

# figlet -f slant ArchLinux | lolcat -a -d 5
# bash -c 'fortune | ponythink'
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'  # on, lcd, gsap, etc.
# export _JAVA_AWT_WM_NONREPARENTING=1  # for awesome is a non-reparenting wm.
# export _JAVA_OPTIONS='-Djava.net.preferIPv6Addresses=true -Djava.net.preferIPv4Stack=false'
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
