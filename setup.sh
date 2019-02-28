#! /bin/zsh

DOT_FILES=( .??* )
NG_LIST=( .git .gitignore .DS_Store )

if [ ! -d $HOME/zsh ]; then
  mkdir $HOME/zsh
fi

for file in ${DOT_FILES[@]}
do
  if [ ! -d $file ]; then;
    if (( ${NG_LIST[(I)$file]} )); then
      echo $file 'is in NG_LIST'
    else
	    ln -s $HOME/dotfiles/$file $HOME/$file
    fi
  fi
done
