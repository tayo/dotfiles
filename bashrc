# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#####################
# tayo
#####################
export EDITOR='vim'

export TERM='xterm-256color'
#export TERM='xterm-color'
#export DISPLAY=localhost:10.0

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac
color_prompt=yes;

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '     # original
    PS1="\[\033[1;35m\][\$(date +%H%M)]\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[0m\]$ "
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt 

UNAME=`uname`
if [ "$UNAME" == "Linux"  ]; then
    # linux
    alias ls='ls --color'
elif [ "$UNAME" == "Darwin"  ]; then
    # mac terminal
    export CLICOLOR=1
    export LSCOLORS="ExFxcxdxCxegedabagacad" 
elif [ "$UNAME" == "SunOS"  ]; then
    alias vi='vim'
    export TERM='xterm-color'
fi

alias l='ls -CF'
alias la='ls -aCF'
alias ll='ls -lh'
alias ssh='ssh -Y'
alias grep='grep --color=auto -n --exclude=tags'
alias pd='pushd'
alias hh='history | less'
alias vi='vim -O'
alias sr="screen -R"

