# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd' # on, lcd, gsap, etc.
