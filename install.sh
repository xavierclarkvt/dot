#!/bin/bash

DOTFILES_DIR="$(dirname $0)"
OS="$($DOTFILES_DIR/bin/is-supported $DOTFILES_DIR/bin/is-macos macos linux)"
HOMEBREW_PREFIX="$DOTFILES_DIR/bin/is-supported $DOTFILES_DIR/bin/is-arm64 /opt/homebrew /usr/local"
XDG_CONFIG_HOME="$HOME/.config"
STOW_DIR=$DOTFILES_DIR
ACCEPT_EULA=Y

start_sudo () {
    sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

core_macos () {
    echo "good shit, should work I think"
}

core_linux () {
    apt-get update
	apt-get upgrade -y
	apt-get dist-upgrade -f

    $DOTFILES_DIR/bin/is-executable stow || apt-get -y install stow
}

start_stow () {
    for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then \
		mv -v $(HOME)/$$FILE{,.bak}; fi; done
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME) runcom
	stow -t $(XDG_CONFIG_HOME) config
}

if [[$OS == 'macos']]; then
    start_sudo
    core_macos
    get_packages
    stow_macos
    start_stow
else 
    core_linux
    start_stow
fi



