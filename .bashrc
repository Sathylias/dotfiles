#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export fancypants=no
export EDITOR=vim

#orange="$(tput setaf 208)"
#red="$(tput setaf 124)"
#purple="$(tput setaf 125)"
#green="$(tput setaf 40)"
#bold="$(tput bold)"
#reset="$(tput sgr0)"

green="\[\e[1;32m\]"
yellow="\[\e[1;33m\]"
color="\[\e[1;34m\]"
reset="\[\e[0m\]"
bold="\[\e[1m\]"

HISTCONTROL=ignoreboth
export COLORTERM=truecolor

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#if [ "$fancypants" = "yes" ]; then
#    PS1="${purple}\u${reset}@${green}\h${reset}:${bold}\w${reset} "
#else 
    #PS1="\u@\h:\w "
#fi

# With FiraCode fonts, this looks very nice
#PS1="$reset<=($green\u$reset at $yellow\h$reset in $color\w$reset)>= "
PS1="${bold}(\w) $ ${reset}"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if command -v theme.sh > /dev/null; then
	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l | tail -n1)"

	# Binds C-o to the previously active theme.
	bind -x '"\C-o":"theme.sh $(theme.sh -l|tail -n2|head -n1)"'

	alias th='theme.sh -i'
	alias thl='theme.sh --light -i'
	alias thd='theme.sh --dark -i'
fi

[[ -d ~/scripts ]] && export PATH=$HOME/scripts:$PATH

export GOPATH=$HOME/golang
