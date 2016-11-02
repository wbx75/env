#!/bin/bash

# platform
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
else
    platform='notlinux'
fi

# ls output colors
export LSCOLORS=exfxcxdxbxgxgxBxBxexex
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36:cd=36:su=1;31:sg=1;31:tw=34:ow=34'

export TERM=xterm-256color

# for git
export EDITOR=vi

# attach a tmux session
function ssht() {
  ssh $* -t 'tmux a || tmux || /bin/bash'
}

# alias
if [[ $platform == 'linux' ]]; then
    alias l='ls --color -lFh'
    alias ll='ls --color -alFh'
else
    alias l='ls -lFhG'
    alias ll='ls -alFhG'
fi

alias lo="l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
alias llo="ll | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"

# prompt
if [ $(id -u) -eq 0 ]; then
    # root
    PS1='\n[\D{%F %T}] \[\e[36m\]\w\[\e[0m\]\n\[\e[31m\]\u\[\e[0m\]@\[\e[33m\]\h\[\e[0m\]\$ '
else
    # not root
    PS1='\n[\D{%F %T}] \[\e[36m\]\w\[\e[0m\]\n\[\e[32m\]\u\[\e[0m\]@\[\e[33m\]\h\[\e[0m\]\$ '
fi

# additional config
if [ -f ~/.bash_custom ]; then . ~/.bash_custom; fi

