# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi



# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep -n --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias l='ls -CF'
alias ll='ls -alFh'
alias la='ls -ACF'
alias pd='pushd'
alias hh='history | less'
alias ssh='ssh -Y'
alias grep='grep --exclude=tags'
alias vi='vim -O'
alias sr="screen -R"
#export PATH=$PATH:/home/tayo/bin/

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
