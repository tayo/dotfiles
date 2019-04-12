#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ~

ln -s DIR/vimrc      .vimrc
ln -s DIR/dotvim     .vim
ln -s DIR/tmux.conf  .tmux.conf
ln -s DIR/gitconfig  .gitconfig
ln -s DIR/gitignore  .gitignore
ln -s DIR/gitignore  .gitignore

# Check to make sure there is no special sauce in existing bashrc
#ln -s DIR/bashrc     .bashrc
#ln -s DIR/screenrc   .screenrc

