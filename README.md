# About my dotfiles

My .dotfiles **ViM, DWM, zsh, st** and I use **ArchLinux** as my linux distribution
Mainly inspired by [ornicar](https://github.com/ornicar/dotfiles). For all my programs and shell I use [solarized
colors](http://ethanschoonover.com/solarized) and mainly **Inconsolata** font.

## Requirements

- Recent **ViM** version, does not require any interpreters like ruby or python.
- **git**
- **zsh**
- **wget**
- **256** color terminal client for the best experience

To use tmuxinator:

    gem install tmuxinator

To install dmenu:

    git clone https://github.com/l3pp4rd/dmenu.git ~/.dmenu && cd ~/.dmenu

You most probably need to change the **X11** lib header file location if you are not using arch linux:

    vim config.mk
    make
    sudo make install # will install it in /usr/local/bin

Dmenu shortcut to list all path executables is available at **~/.dotfiles/scripts/path_dmenu**
It will cache all recently used applications, that way it will show up first in search results.

## Screen

![Screenshot](https://raw.github.com/l3pp4rd/dotfiles/master/screen.png)

## Installation

Clone the repository:

    clone git://github.com/l3pp4rd/dotfiles.git ~/.dotfiles

### Terminal client

If you want nice colors with **vim** you should have a terminal client, which supports **256** colors. You may try:

- **st** the simplest and most stable terminal client, supports all general features. You can just grab my version of
[st](https://github.com/l3pp4rd/st) and compile it. If you need transparency, use **xcompmgr** and **transset-df**.
- **rxvt-unicode** you may need to compile it with **256** color support, but it may come with all features from package
manager.
- some others **terminator**, **guake** whatever you like.

### Tmux

You should consider reading about **tmux** (terminal session manager) and install it. **Tmuxinator** is also a
handy tool to be used with tmux. If you use **st** tmux will provide tabs and history scrolling support.
Mouse scroll in urxvt suck and most of the times, tabs and history scrolling are not working well as general
terminal features. So lets just follow UNIX philosophy and install tmux which is a tool built to handle it.

### Zsh

If you do not use **zsh** ignore the .zshrc installation, otherwise you could try to use it instead
of bash - install **zsh** first and use it as your default shell by running:

    chsh -s $(which zsh)

### Install dotfiles

Execute the setup script, follow the configuration options, you may not need to replace all configs:

    ./.dotfiles/setup.sh

Load vim bundles:

    vim +PluginInstall +qall

**NOTE:** most configurations use **Inconsolata** fonts, you should install or change it.

## Window Manager

If you are tired of bloated desktops like gnome, kde.. whatever, would recommend to try [dwm](http://dwm.suckless.org/)

**NOTE:** look how to manage it as an xsession in order to provide a possibility to be used inline
with a login manager like **slim**. You can find an example in my dotfiles.

## changelog

- **2014-04-13** - refactored zsh configuration, to reuse core oh-my-zsh loading features
- **2013-12-20** - switched from pathogen to vundle
- **2013-12-20** - switched powerline to airline, does not require big python setup

