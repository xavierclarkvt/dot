# Dot

These are my MacOS dotfiles. Relies heavily on homebrew, but could be extrapolated to support linux.

Forked from [webpro/dotfiles](https://github.com/webpro/dotfiles) - if you want a custom version of this, use his.

## Highlights

- Minimal efforts to install everything, using a [shell script](./install.sh)
- Mostly based around Homebrew, Node.js, GNU Utils
- Fast and colored prompt
- Updated macOS defaults
- Supports Apple Silicon (M1) (Maybe intel chips)

## Packages Overview

- [Homebrew](https://brew.sh)
- [Node.js + npm LTS](https://nodejs.org/en/download/)
- Latest Git, GNU coreutils, Rust
- Oh-My-ZSH
- A default Firefox instance
- `$EDITOR` (and Git editor) is [GNU nano](https://www.nano-editor.org)

## Installation

On a sparkling fresh installation of macOS:

```bash
sudo softwareupdate -i -a
xcode-select --install
```

The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS). Next you will need to clone the repo manually into the desired location:

```bash
git clone https://github.com/xavierclarkvt/dot.git ~/.dotfiles
```

Use the [install script](./install.sh) to install everything [listed above](#package-overview), and symlink [runcom](./runcom)
and [config](./config) (using [stow](https://www.gnu.org/software/stow/)):

```bash
cd ~/.dotfiles
zsh install.sh
```

## Post-Installation

- `dot dock` (set [Dock items](./macos/dock.sh))
- `dot macos` (set [macOS defaults](./macos/defaults.sh))

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
    update           Update packages and pkg managers (OS, brew, npm, gem)
```
