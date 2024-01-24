#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export EDITOR=vim
export COLORTERM=truecolor
export HISTTIMEFORMAT="%d/%m/%y %T "

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s cdable_vars

green="\[\e[1;32m\]"
yellow="\[\e[33m\]"
red="\[\e[31m\]"
blue="\[\e[1;34m\]"
reset="\[\e[0m\]"

[ -f ~/.bash_functions ] && . ~/.bash_functions
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_secrets ] && . ~/.bash_secrets

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export PS1="($yellow\D{%H:%M}$reset | $green\u$reset at $yellow\h$reset in $blue\w$reset)$yellow\$(git_branch)$reset $ "

# Some useful directory that I can switch to using shopt cdable_vars
export repos="$HOME/devel/.repoman/sathylias"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'


[ -d ~/scripts ] && export PATH=$HOME/scripts:$PATH
[ -d ~/bin ] && export PATH=$HOME/bin:$PATH
