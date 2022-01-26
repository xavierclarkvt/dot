# Dot

These are my MacOS and Ubuntu dotfiles. Forked from [webpro/dotfiles](https://github.com/webpro/dotfiles) - if you want a custom version of this, use his.

## Highlights

- Minimal efforts to install everything, using a [Makefile](./Makefile)
- Mostly based around Homebrew, Caskroom and Node.js, latest Bash + GNU Utils
- Great [Window management](./config/hammerspoon/README.md) (using Hammerspoon)
- Fast and colored prompt
- Updated macOS defaults
- Well-organized and easy to customize
- Supports both Apple Silicon (M1) and Intel chips

## Packages Overview

- [Homebrew](https://brew.sh) (packages: [Brewfile](./install/Brewfile))
- [homebrew-cask](https://github.com/Homebrew/homebrew-cask) (packages: [Caskfile](./install/Caskfile))
- [Node.js + npm LTS](https://nodejs.org/en/download/) (packages: [npmfile](./install/npmfile))
- Latest Git, Bash 4, Python 3, GNU coreutils, curl, Ruby
- [Hammerspoon](https://www.hammerspoon.org) (config: [keybindings & window management](./config/hammerspoon))
- [Mackup](https://github.com/lra/mackup) (sync application settings)
- `$EDITOR` (and Git editor) is [GNU nano](https://www.nano-editor.org)

## Installation

On a sparkling fresh installation of macOS:

```bash
sudo softwareupdate -i -a
xcode-select --install
```

The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS). Next you will need to clone the repo manually into the desired location:

```bash
git clone https://github.com/webpro/dotfiles.git ~/.dotfiles
```

Use the [Makefile](./Makefile) to install everything [listed above](#package-overview), and symlink [runcom](./runcom)
and [config](./config) (using [stow](https://www.gnu.org/software/stow/)):

```bash
cd ~/.dotfiles
make
```

## Post-Installation

- `dot dock` (set [Dock items](./macos/dock.sh))
- `dot macos` (set [macOS defaults](./macos/defaults.sh))
- Mackup
  - Log in to Dropbox (and wait until synced)
  - `ln -s ~/.config/mackup/.mackup.cfg ~` (until [#632](https://github.com/lra/mackup/pull/632) is fixed)
  - `mackup restore`

## The `dotfiles` command

```bash
$ dot help
Usage: dot <command>

Commands:
    clean            Clean up caches (brew, npm, gem, rvm)
    dock             Apply macOS Dock settings
    edit             Open dotfiles in IDE (code) and Git GUI (stree)
    help             This help message
    macos            Apply macOS system defaults
    test             Run tests
    update           Update packages and pkg managers (OS, brew, npm, gem)
```

## Additional Resources

- [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
- [Homebrew](https://brew.sh)
- [Homebrew Cask](https://github.com/Homebrew/homebrew-cask)
- [Bash prompt](https://wiki.archlinux.org/index.php/Color_Bash_Prompt)
- [Solarized Color Theme for GNU ls](https://github.com/seebi/dircolors-solarized)
