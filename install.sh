#!/bin/bash

DOTFILES_DIR="$(dirname $0)"
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

  # brew_packages
  brew bundle --file=$DOTFILES_DIR/install/Brewfile || true

  # install vscode extensions and set settings
  for EXT in $(cat install/Codefile); do codium --install-extension "$EXT"; done
  cp config/vscode-settings.json $HOME/Library/Application\ Support/VSCodium/User/settings.json

  # get_npm
  fnm install --lts # should have been installed from brewfile

  # copy over firefox profile (rewrites any previous versions of these files)
  if [ -d $HOME/Library/Application\ Support/Firefox ]; then # if one exists, make a backup
      mv $HOME/Library/Application\ Support/Firefox $HOME/Library/Application\ Support/Firefox.bak
  fi
  cp -f -R $DOTFILES_DIR/Firefox $HOME/Library/Application\ Support

  # install Oh-My-ZSH
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

start_stow () {
  for FILE in $(ls -A $DOTFILES_DIR/runcom); do 
    if [ -f $HOME/$FILE -a ! -h $HOME/$FILE ]; then # if file exists and not symlink, make backup
    mv -v $HOME/$FILE{,.bak}; 
    fi; 
  done
  mkdir -p $XDG_CONFIG_HOME
  ( cd $DOTFILES_DIR; stow -t $HOME runcom; stow -t $XDG_CONFIG_HOME config )
}

start_sudo
core_macos
start_stow



