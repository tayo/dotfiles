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

# Maxeler variables
#export LM_LICENSE_FILE=$LM_LICENSE_FILE:7193@cidlic0:2100@ee-matlab
alias mdb="make distclean build"
alias mdr="make distclean run"

#export GWT='~tayo/gwt-mac-1.3.3'
#export GWT_EXTERNAL_BROWSER='firefox'

alias b32='export LD_LIBRARY_PATH=/opt/gnu/lib'
alias b64='export LD_LIBRARY_PATH=/opt/gnu/lib/amd64'
alias ball='export LD_LIBRARY_PATH=/opt/gnu/lib/amd64:/opt/gnu/lib'

# Scala variables
#export
# Java
#source /etc/environment
unset JAVA_TOOL_OPTIONS

# M5 simulator definitions
#export M5_ROOT='/tcc/u/tayo/macrochip'
#export PATH=$M5_ROOT/sparc64-xcc/prefix/bin:$PATH 
#export PATH=$M5_ROOT/scons:$PATH
#export M5THREADS_DIR=$M5_ROOT/m5threads

#export PATH=$PATH:/filer1/vol1/ee382a-spr0809/m5_package/scons/
#export PATH=$PATH:/kozyrakis/users/sanchezd/mercurial-1.1.2/
#export PATH=$PATH:/kozyrakis/projects/hw_scheduling/sparc64-xcc/prefix/bin/
