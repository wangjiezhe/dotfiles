export AUTOJUMP_IGNORE_CASE=1

export EDITOR="vim"

export HIST_STAMPS="yyyy-mm-dd"

export HISTSIZE=100000000
export SAVEHIST=100000000

export HISTCONTROL=ignorespace:erasedups
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S'

export PATH=$HOME/bin:$HOME/.local/bin:$(yarn global bin):$HOME/.linuxbrew/bin:$(ruby -e 'print Gem.user_dir'):$HOME/go/bin:$HOME/.cabal/bin:$PATH
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/local/lib/pkgconfig

export MANPATH=$MANPATH:$HOME/.linuxbrew/share/man
export INFOPATH=$INFOPATH:$HOME/.linuxbrew/share/info
export GOPATH=$HOME/go
export LIBRARY_PATH=$LIBRARY_PATH:/usr/lib

export SBCL_HOME=/usr/lib/sbcl

export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
# export GOPROXY=https://goproxy.io

setopt ksh_option_print
setopt no_share_history
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups

# ==== 加载 zplugin ====

source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# ==== 加载 GitHub 插件 ====

zplugin ice lucid wait
zplugin light MichaelAquilina/zsh-you-should-use

zplugin ice lucid wait
zplugin light hlissner/zsh-autopair

zplugin ice lucid wait
zplugin light skywind3000/z.lua

zplugin ice lucid wait='0' atload='_zsh_autosuggest_start'
zplugin light zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept

zplugin ice lucid wait
zplugin light zdharma/fast-syntax-highlighting

zplugin ice lucid wait
zplugin light jocelynmallon/zshmarks

# ==== 加载 OMZ 插件 ====

zplugin snippet OMZ::lib/git.zsh

zplugin snippet OMZ::lib/clipboard.zsh
zplugin snippet OMZ::lib/completion.zsh
zplugin snippet OMZ::lib/history.zsh
zplugin snippet OMZ::lib/key-bindings.zsh
zplugin snippet OMZ::lib/theme-and-appearance.zsh

zplugin snippet OMZ::plugins/sudo/sudo.plugin.zsh

zplugin ice lucid wait
zplugin snippet OMZ::plugins/git/git.plugin.zsh

zplugin snippet OMZ::plugins/git-extras/git-extras.plugin.zsh
zplugin snippet OMZ::plugins/gitignore/gitignore.plugin.zsh
zplugin snippet OMZ::plugins/github/github.plugin.zsh
zplugin snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zplugin snippet OMZ::plugins/history/history.plugin.zsh
zplugin snippet OMZ::plugins/encode64/encode64.plugin.zsh
zplugin snippet OMZ::plugins/battery/battery.plugin.zsh
zplugin snippet OMZ::plugins/colorize/colorize.plugin.zsh
# zplugin snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zplugin snippet OMZ::plugins/copydir/copydir.plugin.zsh
zplugin snippet OMZ::plugins/copyfile/copyfile.plugin.zsh
zplugin snippet OMZ::plugins/cp/cp.plugin.zsh
zplugin snippet OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
zplugin snippet OMZ::plugins/heroku/heroku.plugin.zsh
zplugin snippet OMZ::plugins/mercurial/mercurial.plugin.zsh
zplugin snippet OMZ::plugins/nmap/nmap.plugin.zsh
zplugin snippet OMZ::plugins/npm/npm.plugin.zsh
zplugin snippet OMZ::plugins/rsync/rsync.plugin.zsh
zplugin snippet OMZ::plugins/svn/svn.plugin.zsh
zplugin snippet OMZ::plugins/dircycle/dircycle.plugin.zsh
zplugin snippet OMZ::plugins/dirhistory/dirhistory.plugin.zsh
zplugin snippet OMZ::plugins/dirpersist/dirpersist.plugin.zsh
zplugin snippet OMZ::plugins/systemd/systemd.plugin.zsh
zplugin snippet OMZ::plugins/percol/percol.plugin.zsh

zplugin ice svn
zplugin snippet OMZ::plugins/extract

zplugin ice svn
zplugin snippet OMZ::plugins/pip

zplugin ice svn
zplugin snippet OMZ::plugins/gitfast

zplugin ice svn
zplugin snippet OMZ::plugins/gem

zplugin ice svn
zplugin snippet OMZ::plugins/pylint

zplugin ice svn
zplugin snippet OMZ::plugins/tmux

zplugin ice svn
zplugin snippet OMZ::plugins/yarn

zplugin ice as="completion"
zplugin snippet OMZ::plugins/cargo/_cargo

zplugin ice as="completion"
zplugin snippet OMZ::plugins/rust/_rust

zplugin ice as="completion"
zplugin snippet OMZ::plugins/fd/_fd

zplugin ice as="completion"
zplugin snippet OMZ::plugins/httpie/_httpie

zplugin ice as="completion"
zplugin snippet OMZ::plugins/pep8/_pep8

# ==== 主题 ====

if [[ "$TERM" == "linux" ]]; then
  export PURE_PROMPT_SYMBOL=">"
  zplugin ice pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd"
  zplugin light Aloxaf/pure
else
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  zplugin ice depth=1
  zplugin light romkatv/powerlevel10k

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# === Alias ===

alias ...="cd ../.."
alias ....="cd ../../.."
alias pbcopy="xclip -sel clip"
# alias sudo="sudo -E"
alias gsubu="git submodule update --init --recursive"
alias gfu="git fetch upstream"
alias gmuo="git merge upstream/master origin/master"
alias gmms="git merge master src"
alias glga="git log --stat --decorate --graph --all --show-signature"
# unalias gap
# unalias gp
# unalias gsi
# unalias gm
alias gps="git push"
alias lb="ls -B"
alias ls="exa"
alias l.="ls -d .*"
alias l="ls -l"
#alias la="ls -A"
alias ll="ls -la"
alias zshrc='$EDITOR ~/.zshrc'
alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias cman="man -L zh_CN.utf8"        # Man in Chinese
alias ack-grep="ack"
alias mv="advmv -g"
alias cp="advcp -g"
# alias rm="gvfs-trash"
# alias yiy="sudo yum install -y"
# alias yuy="sudo yum upgrade -y"
# alias betty="$HOME/Downloads/github/betty/main.rb"
alias dfh="df -Th"
alias dud='du -d 1 -h'
alias duf='du -sh *'
# alias fd='find . -type d -name'
# alias ff='find . -type f -name'
# alias pingtest="ping -c5 162.105.130.1"
# PIP_UPGRADE="$HOME/Downloads/github/wangjiezhe/MyScripts/pip_upgrade/pip_upgrade.py"
# alias pip2-upgrade="sudo -H python2 ${PIP_UPGRADE}"
# alias pip3-upgrade="sudo -H python3 ${PIP_UPGRADE}"
# alias yaourt4="yaourt --aur-url https://aur4.archlinux.org"
alias dmesg="dmesg -H --color=always"
# alias mpv="mpv --hwdec=vaapi --vo=vaapi"
# alias pip-upgrade="yolk -U|cut -d ' ' -f 1|xargs pip install --upgrade"
alias sl=ls
alias sudp=sudo
alias suod=sudo
# alias vi=vim
alias e="emacsclient -t"
alias ee="emacs -nw"
alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
alias sc="systemctl"
alias scu="systemctl --user"
alias jj='jump'
alias ssh-gbk='luit -encoding gbk ssh'
# alias yacl='yaourt -Sc'
alias preview="fzf --preview 'bat --color always {}'"
# alias nvrun="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"

# Global alias
alias -g quiet="-q 2>/dev/null"        # Used for yum
alias -g wpp='-e "http_proxy=http://127.0.0.1:8088/" -e "https_proxy=http://127.0.0.1:8088/"'        # Used for wget
alias -g gpp="--http-proxy http://127.0.0.1:8088/"        # Used for gem
alias -g cpp="-k --proxy http://127.0.0.1:8088/"    # User for curl
# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep -i'
alias -g L="| less"
alias -g M="| most"
alias -g P="| percol"
alias -g GG="2>/dev/null | grep -i"
alias -g LL="2>&1 | pygmentize | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2>/dev/null"
alias -g NUL=">/dev/null 2>&1"
# alias -g PP="2>&1| pygmentize -l pytb"

# ==== Functions ====

exists() {
    which $1 &> /dev/null
}
source_if_exists() {
    if [ -s $1 ]; then
        source $1
    fi
}

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
# rpmfind() {
#     if [[ $# -eq 1 ]]
#     then
#         rpm -qf $(which $1)
#     else
#         echo "Usage: rpmfind command"
#     fi
# }

# ps grep
psg () {
    ps -eaf | grep -i "$@" | grep -v -e "grep .* -i"
}

psgw () {
    ps auxww | grep -i "$@" | grep -v -e "grep .* -i"
}

# export YUMDIR=/etc/yum.repos.d

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
    lynx -accept_all_cookies -source "$prefix://www${dotflg}bing${dotflg}com/dict/search${qmflg}q=$word${andflg}qs=n${andflg}form=CM${andflg}pq=$word${andflg}sc=0-0${andflg}sp=-1${andflg}sk=" | html2text2 | sed '1,12d' | less
}

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

# opencc
t2s() {
    opencc -i "$1" -o "$1" -c t2s
}
s2t() {
    opencc -i "$1" -o "$1" -c s2t
}
rename-t2s() {
    mv "$1" $(echo "$1" | opencc -c t2s --)
}
echo-t2s() {
        echo "$1" | opencc -c t2s --
}

clipboard2qr () {
  data="$(xsel)"
  echo $data
  echo $data | qrencode -t UTF8
}

# 文件名从 GB 转码，带确认
mvgb () {
  for i in $*; do
    new="`echo $i|iconv -f utf8 -t latin1|iconv -f gbk`"
    echo $new
    echo -n 'Sure? '
    read -q ans && mv -i $i $new
    echo
  done
}

pid () {
  s=0
  for i in $*; do
    echo -n "$i: "
    r=$(cat /proc/$i/cmdline|tr '\0' ' ' 2>/dev/null)
    if [[ $? -ne 0 ]]; then
      echo not found
      s=1
    else
      echo $r
    fi
  done
  return $s
}

# 快速查找当前目录下的文件
# rg is 3x faster than ag, and find 2x
if (( $+commands[rg] )) then
  s () {
    rg --files -g "*$1*"
  }
else
  s () {
    find . -name "*$1*"
  }
fi

zplugin ice lucid wait atload="zpcompinit; zpcdreplay; unalias gap gp gm gsi"
zplugin snippet ~/.travis/travis.sh
