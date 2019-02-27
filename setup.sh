#! /bin/bash

DOT_FILES=( .??* )

mkdir $HOME/zsh

for file in ${DOT_FILES[@]}
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
	ln -s $HOME/dotfiles/$file $HOME/$file
done
