#!/usr/bin/env bash
# Simple Bootstrap script to install my dotfiles

dotfiles_dir=$(dirname $(dirname $(readlink -fm $0)))

home_dotfiles=(
    .bashrc
    .bash_functions
    .bash_aliases
    .gitconfig
    .guile
    .tmux.conf
    .vimrc
)

# Symlink our dotfiles
for dotfile in "${home_dotfiles[@]}"; do
    echo "> Symlinking $dotfile to HOME directory."
    if [[ -d "$dotfiles_dir/$dotfile" ]]; then
    	rm -rf "$HOME/$dotfile" && ln -sf "$dotfiles_dir/$dotfile" $HOME/
    else
    	ln -sf "$dotfiles_dir/$dotfile" $HOME/$dotfile
    fi
done

# Place various configurations where they're supposed to be 
mkdir -p "$HOME/.gnupg" && cp "$dotfiles_dir/gpg-agent.conf" "$HOME/.gnupg/"
