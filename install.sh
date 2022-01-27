#!/bin/bash

DOTFILES_DIR="$(dirname $0)"
OS="$(""$DOTFILES_DIR""/bin/is-supported ""$DOTFILES_DIR""/bin/is-macos macos linux)"
HOMEBREW_PREFIX="$(""$DOTFILES_DIR""/bin/is-supported ""$DOTFILES_DIR""/bin/is-arm64 /opt/homebrew /usr/local)"
XDG_CONFIG_HOME="$HOME/.config"
STOW_DIR=$DOTFILES_DIR
ACCEPT_EULA=Y

start_sudo () {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until this script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

core_macos () {

    # get_brew
    is-executable brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(""$HOMEBREW_PREFIX""/bin/brew shellenv)"

    # get_git
	brew install git git-extras

    # brew_packages
    brew bundle --file=$DOTFILES_DIR/install/Brewfile || true

    # cask_apps
    brew bundle --file=$DOTFILES_DIR/install/Caskfile || true
	defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua" # install hammerspoon config
	for EXT in $(cat install/Codefile); do code --install-extension $$EXT; done # install vscode extensions
	xattr -d -r com.apple.quarantine ~/Library/QuickLook 

    # get_npm
    fnm install --lts # should have been installed from brewfile
    eval $(fnm env); npm install -g $(cat install/npmfile)

    # get_rust
    brew install rust

    $DOTFILES_DIR/bin/is-executable stow || brew install stow
}

core_linux () {
    apt-get update
	apt-get upgrade -y
	apt-get dist-upgrade -f

    $DOTFILES_DIR/bin/is-executable stow || apt-get -y install stow
}

start_stow () {
    for FILE in $(ls -A $DOTFILES_DIR/runcom); do 
        if [ -f $HOME/$FILE -a ! -h $HOME/$FILE ]; then # if file exists and not symlink, make backup
		    mv -v $HOME/$FILE{,.bak}; 
        fi; 
    done
	mkdir -p $XDG_CONFIG_HOME
	stow -t $HOME $DOTFILES_DIR/runcom
	stow -t $XDG_CONFIG_HOME $DOTFILES_DIR/config
}

if [[ $OS == 'macos' ]]; then
    start_sudo
    core_macos
    start_stow
else 
    core_linux
    start_stow
fi



