git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

gogh() {
    bash -c "$(wget -qO- https://git.io/vQgMr)" 
}

backup_gnome_terminal() {
    dconf dump /org/gnome/terminal/ > $HOME/devel/.repoman/dotfiles/gnome_terminal_settings.txt
}
