#! /bin/bash

# Must be called from containing directory

ln -sf ${PWD}/.bashrc ~/ &&
ln -sf ${PWD}/.Xresources ~/ &&
ln -sf ${PWD}/.xinitrc ~/ &&
ln -sf ${PWD}/init.el ~/.emacs.d/ &&
ln -sf ${PWD}/xmonad.hs ~/.xmonad/
ln -sf ${PWD}/terminator-config ~/.config/terminator/config
sudo ln -sf ${PWD}/60-swap.conf /usr/share/X11/xorg.conf.d/
