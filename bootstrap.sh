#!/usr/bin/env bash

# Simple Bootstrap script to install my dotfiles

current_dir=$(pwd)

home_dotfiles=(
    .bashrc
    .bash_functions
    .bash_aliases
    .emacs
    .gitconfig
    .guile
    .tmux.conf
    .vimrc
)

# Symlink our dotfiles
for dotfile in "${home_dotfiles[@]}"; do
    echo "> Symlinking $dotfile to HOME directory."
    ln -sf "$current_dir/$dotfile" $HOME/$dotfile
done

# Place various configurations where they're supposed to be 
mkdir -p "$HOME/.gnupg" && cp gpg-agent.conf "$HOME/.gnupg/"
