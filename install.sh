#!/usr/bin/env bash

# bash
# append to existing .bashrc
if ! grep -Fxq "source ~/dotfiles/bashrc" ~/.bashrc ; then
	echo "source ~/dotfiles/bashrc" >> ~/.bashrc
fi

# nano
ln -sf ./dotfiles/nanorc ~/.nanorc

# tmux
if [ ! -d ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
ln -sf ./dotfiles/tmux.conf ~/.tmux.conf

# git
ln -sf ./dotfiles/gitconfig ~/.gitconfig

# hg
ln -sf ./dotfiles/hgrc ~/.hgrc

# npm
ln -sf ./dotfiles/npmrc ~/.npmrc

# nvm
if [ ! -d ~/.nvm ]; then
	git clone https://github.com/creationix/nvm.git ~/.nvm
	cd ~/.nvm
	git checkout `git describe --abbrev=0 --tags`
fi
