# ENV stuff

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nano"
## History
export HISTSIZE=32768;
export HISTFILESIZE="${HISTSIZE}";
export SAVEHIST=4096
export HISTCONTROL=ignoredups:erasedups
## Enable colors
export CLICOLOR=1
## Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
## Highlight section titles in man pages
export LESS_TERMCAP_md="${yellow}";
## Append to the Bash history file, rather than overwriting it
shopt -s histappend
## Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Updates to path

## start up FNM (node version manager)
eval "$(fnm env --use-on-cd)"
## Add .dotfiles/bin to path
if [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi
export DOTFILES_DIR
PATH="$DOTFILES_DIR/bin:$PATH"

## Add homebrew to path
export HOMEBREW_PREFIX=$($DOTFILES_DIR/bin/is-supported $DOTFILES_DIR/bin/is-arm64 /opt/homebrew /usr/local)
eval "$(""$HOMEBREW_PREFIX""/bin/brew shellenv)"

# Aliases

## macOS specific
alias cask="brew cask"
### start screen saver
alias afk="open /System/Library/CoreServices/ScreenSaverEngine.app"
### log off
alias logoff="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
### Show/hide desktop icons
alias desktopshow="defaults write com.apple.finder CreateDesktop -bool true && killfinder"
alias desktophide="defaults write com.apple.finder CreateDesktop -bool false && killfinder"
### Show system information
alias displays="system_profiler SPDisplaysDataType"
alias cpu="sysctl -n machdep.cpu.brand_string"
alias ram="top -l 1 -s 0 | grep PhysMem"