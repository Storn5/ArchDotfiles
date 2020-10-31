#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls --color=always"
PS1='\[\e[32m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\]: \[\e[33m\]\w\[\e[m\] \\$ '

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh
