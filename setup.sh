#! /bin/zsh

DOT_FILES=( .??* )
NG_LIST=( .git .gitignore .DS_Store)

# zshディレクトリのチェック
if [ ! -d $HOME/zsh ]; then
  mkdir $HOME/zsh
fi

# カラースキームのチェック
if [ ! -f $HOME/.vim/colors/molokai.vim ]; then
  mkdir -p $HOME/.vim/colors
  curl -fsOL https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim \
    && \
      mv molokai.vim $HOME/.vim/colors/molokai.vim
fi
# templateディレクトリをリンク付け
if [ ! -d $HOME/.vim/template ]; then
  ln -s $HOME/dotfiles/template $HOME/.vim
fi

CURRENT=$(cd $(dirname $0); pwd)
for file in ${DOT_FILES[@]}
do
  if [ ! -d $file ]; then;
    if (( ${NG_LIST[(I)$file]} )); then
      echo $file 'is in NG_LIST'
    else
      ln -s $CURRENT/$file $HOME/$file
    fi
  fi
done
