export PATH=$HOME/scripts:$PATH

autoload -U colors && colors

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="sathylias"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if command -v theme.sh > /dev/null; then
	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l | tail -n1)"

	alias th='theme.sh -i'

	# Interactively load a light theme
	alias thl='theme.sh --light -i'

	# Interactively load a dark theme
	alias thd='theme.sh --dark -i'
fi

eval $(keychain --eval homelab)

source $(which markit)
