#!/bin/bash

# ls output colors
export LSCOLORS=exfxcxdxbxgxgxBxBxexex
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36:cd=36:su=1;31:sg=1;31:tw=34:ow=34'

export EDITOR=vi

# function
function ssht() {
  ssh $* -t 'tmux a || tmux || /bin/bash'
}

# alias
alias ll='ls -alFhG'
alias l='ls -lFhG'

# prompt
if [ $(id -u) -eq 0 ]; then
    # root
    PS1='\n[\D{%F %T}] \[\e[36m\]\w\[\e[0m\]\n\[\e[31m\]\u\[\e[0m\]@\[\e[33m\]\h\[\e[0m\]\$ '
else
    # not root
    PS1='\n[\D{%F %T}] \[\e[36m\]\w\[\e[0m\]\n\[\e[32m\]\u\[\e[0m\]@\[\e[33m\]\h\[\e[0m\]\$ '
fi

export TERM=xterm-256color

if [ -f ~/.bash_custom ]; then . ~/.bash_custom; fi

