# ~/.zprofile

# figlet -f slant ArchLinux | lolcat -a -d 5
# fortune | ponythink
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'  # on, lcd, gsap, etc.
# export _JAVA_AWT_WM_NONREPARENTING=1  # for awesome is a non-reparenting wm.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
