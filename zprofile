# ~/.zprofile

# figlet -f slant ArchLinux | lolcat -a -d 5
# fortune | ponythink
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd' # on, lcd, gsap, etc.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
