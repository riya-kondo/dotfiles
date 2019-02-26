#! /bin/bash

DOT_FILES=( .zshrc .vimrc .proxy_setup )

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
