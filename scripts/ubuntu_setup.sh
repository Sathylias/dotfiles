#!/usr/bin/env bash
#
# Program: ubuntu_setup.sh (Ubuntu Installation Script)
# Author: Maxime Daraiche (maxiscoding@gmail.com)
#
# Description: Configure my Ubuntu system

packages=(
  emacs
  vim
  git
  fonts-firacode
  fonts-terminus
  fonts-hack
  fonts-cascadia-code
  ranger
  ueberzug
  mupdf
  tmux
  curl
  pass
  fzf
  weechat
  keychain
  dbus-x11
)

main() {
  
  # Position new windows in the center
  gsettings set org.gnome.mutter center-new-windows true
  
  # Keyboard speed & delay
  gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
  gsettings set org.gnome.desktop.peripherals.keyboard delay 200
  
  # Load my Gnome Terminal preferences and colorscheme
  dconf reset -f /org/gnome/terminal/
  dconf load /org/gnome/terminal/ < ../gnome_terminal.settings

  # Disable sudo message and remove .sudo_as_admin_successful from $HOME
  echo "Defaults !admin_flag" >> /etc/sudoers.d/disable_sudo_homefile

  # Install required packages
  apt install "${packages[@]}" -y

}

main "$@"

