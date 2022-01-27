#!/bin/bash

DOTFILES_DIR="$(dirname $0)"
OS="$($DOTFILES_DIR/bin/is-supported $DOTFILES_DIR/bin/is-macos macos linux)"
HOMEBREW_PREFIX="$DOTFILES_DIR/bin/is-supported $DOTFILES_DIR/bin/is-arm64 /opt/homebrew /usr/local"
XDG_CONFIG_HOME="$HOME/.config"
STOW_DIR=$DOTFILES_DIR
ACCEPT_EULA=Y
