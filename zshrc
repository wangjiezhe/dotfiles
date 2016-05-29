# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# Default
# export ZSH_THEME="robbyrussell"

export ZSH_THEME="einbisschenmath"
# export ZSH_THEME="terminalparty"

# USER + HOST + DIRECTORY + GIT
# export ZSH_THEME="intheloop"
# export ZSH_THEME="strug"
# export ZSH_THEME="agnoster"

# USER + HOST + DIRECTORY + GIT + TIME
# export ZSH_THEME="fino-time"
# export ZSH_THEME="ys"
# export ZSH_THEME="crcandy"
# export ZSH_THEME="amuse"

# USER + HOST + DIRECTORY + GIT + TIME(RIGHT)
# export ZSH_THEME="pmcgee"
# export ZSH_THEME="dst"

# Random
# export ZSH_THEME="random"

# Unkown
# export ZSH_THEME="emotty"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large reppermissiveositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# For plugin copydir and copyfile
alias pbcopy="xclip -sel clip"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast git-extras fedora cp history web-search rsync github
        # emoji emoji-clock emotty
        docker docker-compose archlinux autojump autopep8 bgnotify colored-man-pages colorize command-not-found
        dircycle dirhistory dirpersist django encode64 extract fab, fancy-ctrl-z fbterm gem adb
        gitignore golang httpie mercurial nmap npm pep8 pip pylint python sudo svn themes zsh_reload
        copydir copyfile)
export plugins

source "$ZSH"/oh-my-zsh.sh

# Customize to your needs...

# Alias
# alias sudo="sudo -E"
alias gsubu="git submodule update --init --recursive"
alias gfu="git fetch upstream"
alias gmuo="git merge upstream/master origin/master"
alias gmms="git merge master src"
alias glga="git log --stat --decorate --graph --all --show-signature"
# unalias gap
unalias gp
unalias gsi
unalias gm
alias gps="git push"
alias lb="ls -B"
alias l.="ls -d .*"
alias ll="ls -lh"
alias l="ls -lFh"
alias la="ls -lAFh"
alias zshrc='$EDITOR ~/.zshrc'
alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias cman="man -L zh_CN.utf8"		# Man in Chinese
alias ack-grep="ack"
alias mv="amv -g"
alias cp="acp -g"
alias yiy="sudo yum install -y"
alias yuy="sudo yum upgrade -y"
alias betty="$HOME/Downloads/github/betty/main.rb"
alias bpython3="python3-bpython"
alias dfh="df -h"
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias pingtest="ping -c5 162.105.130.1"
PIP_UPGRADE="/home/wangjiezhe/Downloads/github/wangjiezhe/MyScripts/pip_upgrade/pip_upgrade.py"
alias pip2-upgrade="sudo -H python2 ${PIP_UPGRADE}"
alias pip3-upgrade="sudo -H python3 ${PIP_UPGRADE}"
# alias yaourt4="yaourt --aur-url https://aur4.archlinux.org"
alias dmesg="dmesg --color=always"
# alias mpv="mpv --hwdec=vaapi --vo=vaapi"
# alias move-mp3="mv ~/Downloads/*.mp3 ~/Documents/语音与听说词汇/网测录音"
# alias pip-upgrade="yolk -U|cut -d ' ' -f 1|xargs pip install --upgrade"
alias sl=ls
alias sudp=sudo
alias suod=sudo
alias vi=vim
alias e="emacsclient -t"
alias ee="emacs -nw"
alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
# Global alias
alias -g quiet="-q 2>/dev/null"		# Used for yum
alias -g wpp1='-e "http_proxy=http://pkuproxy.phiy.me:1898/"'		# Used for wget
alias -g gpp1="--http-proxy http://pkuproxy.phiy.me:1898/"		# Used for gem
alias -g cpp1="--proxy http://pkuproxy.phiy.me:1898/"
alias -g wpp2='-e "http_proxy=http://127.0.0.1:8087/"'		# Used for wget
alias -g gpp2="--http-proxy http://127.0.0.1:8087/"		# Used for gem
alias -g cpp2="-k --proxy http://127.0.0.1:8087/"	# User for curl
# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g PP="| percol"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

# User's function
# make a directory and open it
mkcd() {
        dir="$*";
        mkdir -p "$dir" && cd "$dir";
}
# Safer curl | sh'ing
curlsh() {
        file=$(mktemp -t curlsh.XXXXXX) || { echo "Failed creating file"; return; }
        curl -s "$1" > $file || { echo "Failed to curl file"; return; }
        $EDITOR $file || { echo "Editor quit with error code"; return; }
        sh $file;
        rm $file;
}
# Open the next directory
cdnext() {
        oldIFS=IFS
        IFS=,
        count=1
        for file in $(ls -F ..|grep /|tr '\n' ,)
        do
                alldirs[count]="$file"
                let count++
        done
        IFS=$oldIFS

        currentdir=$(pwd|sed "s,^.*/\([^/]*\)$,\1/,")
        for (( num=1; num<count; num++ ))
        do
                [ $alldirs[$num] = $currentdir ] && break
        done
        let num++
        let count--
        if [ $num -lt $count ]
        then
                nextdir="../$alldirs[$num]"
        else
                echo "All directories have been circulated. Restart from the first."
                nextdir="../$alldirs[1]"
        fi

        cd "$nextdir"
}
# Correctly display Chinese in command `tree`
# tree() {
#       /usr/bin/tree $* | ascii2uni -aK 2>/dev/null
# }

duh() {
        du -d1 -h -a $* | sort -h
}

# Find the rpm that provides the command
rpmfind() {
        if [[ $# -eq 1 ]]
        then
                rpm -qf $(which $1)
        else
                echo "Usage: rpmfind command"
        fi
}

# ps grep
psg () {
        ps -eaf | grep -i "$@" | grep -v -e "grep .* -i"
}

psgw () {
        ps auxww | grep -i "$@" | grep -v -e "grep .* -i"
}

export YUMDIR=/etc/yum.repos.d

# git subtree push
gsp () {
        git subtree push -P $1 $1 master
}

# git subtree push all
gspa () {
        for r in $(git remote)
        do
                if [[ $r != "origin" ]] && [[ $r != "upstream" ]]
                then
                        git subtree push -P $r $r master
                fi
        done
}

# git subtree pull
gsl () {
        git subtree pull -P $1 $1 master
}

# Path
#PATH=$PATH/sbin:/usr/sbin:/usr/local/sbin::/bin:/usr/bin:/usr/local/bin
PATH=$HOME/.cask/bin:$PATH
PATH=$HOME/bin:$HOME/.local/bin:$HOME/.vim/bin:$PATH
#PATH=$PATH:/usr/lib64/sagemath/local/bin
#PATH=$PATH:/usr/lib/TeXmacs/bin
#PATH=$PATH:$HOME/Downloads/depot_tools
#PATH=$PATH:/usr/lib64/qt4/bin
PATH=$PATH:$HOME/.linuxbrew/bin
#PATH=$PATH:/usr/local/MATLAB/R2014b/bin
#PATH=$PATH:/usr/bin/core_perl:/usr/bin/site_perl:/usr/bin/vendor_perl
PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin
#PATH=$PATH:/usr/lib/ccache/bin
PATH=$PATH:$HOME/go/bin
PATH=$PATH:.
export PATH
# Path for pkg-config
#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/local/lib/pkgconfig

export MANPATH=$MANPATH:$HOME/.linuxbrew/share/man
export INFOPATH=$INFOPATH:$HOME/.linuxbrew/share/info
export GOPATH=$HOME/go

# fpath=(/usr/share/zsh/$(zsh --version|awk '{print $2}')/functions ${fpath})

# Use fcitx rather than ibus
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS="@im=fcitx"

# Settings for cheat
export EDITOR="vim"
#export ALTERNATE_EDITOR="emacs" EDITOR="emacsclient" VISUAL="emacsclient"
# export ALTERNATE_EDITOR="" EDITOR="emacsclient -t -a emacs"
export CHEATCOLOR=true
# source /home/wangjiezhe/Downloads/github/cheat/cheat/autocompletion/cheat.zsh
fpath=($HOME/Downloads/github/cheat/cheat/autocompletion $fpath)

# Enable autojump
# Already enabled by oh-my-zsh plugin autojump
# source /etc/profile.d/autojump.zsh
# [[ -s /home/wangjiezhe/.autojump/etc/profile.d/autojump.sh ]] \
#       && source /home/wangjiezhe/.autojump/etc/profile.d/autojump.sh
# Enable zsh tab completion
autoload -U compinit && compinit -u
# Always ignore case
export AUTOJUMP_IGNORE_CASE=1

# Swap Ctrl_L and CapsLock
# Enable Ctrl+Alt+Backspace to kill X
#if [[ -n $DISPLAY ]]; then
#		setxkbmap -option ctrl:swapcaps
#		setxkbmap -option terminate:ctrl_alt_bksp
#		xmodmap ~/.xmodmap 2>/dev/null
#fi

# Colored man pages
# Already enabled by oh-my-zsh plugin colored-man
# export PAGER="vimpager"
# export PAGER="most"
# man() {
#     env LESS_TERMCAP_mb=$'\E[01;31m' \
#     LESS_TERMCAP_md=$'\E[01;38;5;74m' \
#     LESS_TERMCAP_me=$'\E[0m' \
#     LESS_TERMCAP_se=$'\E[0m' \
#     LESS_TERMCAP_so=$'\E[38;5;246m' \
#     LESS_TERMCAP_ue=$'\E[0m' \
#     LESS_TERMCAP_us=$'\E[04;38;5;146m' \
#     man "$@"
# }

# [ -f /usr/share/Modules/init/zsh ] && source /usr/share/Modules/init/zsh

# autoload -Uz url-quote-magic

# npm completion
# enabled by oh-my-zsh plugin npm
# source ~/.npm-completion.sh

PERL_MB_OPT="--install_base \"/home/wangjiezhe/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/wangjiezhe/perl5"; export PERL_MM_OPT;

# source "/usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh"

unset SSH_ASKPASS

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip pip3
# pip zsh completion end

# OPAM configuration
. /home/wangjiezhe/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval $(opam config env)

# rehash automatically
setopt nohashdirs

# Bing Dict Encapsulation
function sword()
{
    local word;
    word=$1;
    word=$(echo $word | tr ' ' '+');
    local prefix='https'
    local dotflg='.'
    local andflg='&'
    local qmflg='?'
    lynx -accept_all_cookies -source "$prefix://www${dotflg}bing${dotflg}com/dict/search${qmflg}q=$word${andflg}qs=n${andflg}form=CM${andflg}pq=$word${andflg}sc=0-0${andflg}sp=-1${andflg}sk=" | html2text | sed '1,12d' | less
}

# Pinyin completion
if [ -s /usr/share/pinyin-completion/shell/pinyin-comp.zsh ]; then
        source /usr/share/pinyin-completion/shell/pinyin-comp.zsh
fi

# Command not found
# Already enabled by oh-my-zsh plugin command-not-found
if [ -s /usr/share/doc/pkgfile/command-not-found.zsh ]; then
        source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# Coloerd less
#export LESS='-R'
#export LESSOPEN="| /bin/source-highlight-esc.sh %s"

ptyless() {
    zmodload zsh/zpty
    zpty ptyless ${1+"$@"}            # ptyless, name of pty
    zpty -r ptyless > /tmp/ptyless.$$ # Write to file, just dunno why pipeline doesn't work fine here
    less /tmp/ptyless.$$
    rm -f /tmp/ptyless.$$
    zpty -d ptyless                   # remove used pty
}

# Explain shell
explain () {
  if [ "$#" -eq 0 ]; then
    while read "cmd?Command: "; do
      curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$cmd"
    done
    echo "Bye!"
  elif [ "$#" -eq 1 ]; then
    curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$1"
  else
    echo "Usage"
    echo "explain                  interactive mode."
    echo "explain 'cmd -o | ...'   one quoted command to explain it."
  fi
}

# added by travis gem
[ -f /home/wangjiezhe/.travis/travis.sh ] && source /home/wangjiezhe/.travis/travis.sh

# python 命令行模式 自动补全
# export PYTHONSTARTUP=~/.pythonstartup.py

export HISTCONTROL=ignorespace:erasedups
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S'

TF_ALIAS=fuck alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

# Interactive pgrep/pkill with percol
function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}
function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""
    else
        QUERY=$1
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}

# zsh history search with percol
function exists { which $1 &> /dev/null }
if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

# z
[ -s /usr/lib/z.sh ] && . /usr/lib/z.sh
export _Z_OWNER=wangjiezhe

# fish shell like syntax highlighting
source $HOME/Downloads/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
