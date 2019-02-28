#! /bin/bash

DOT_FILES=( .??* )

if [ ! -d {$HOME/zsh} ]; then
  mkdir $HOME/zsh
fi

for file in ${DOT_FILES[@]}
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
	ln -s $HOME/dotfiles/$file $HOME/$file
done
