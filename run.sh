#!/bin/bash

#soft 
sudo apt-get install git
sudo apt-get install screen

PWD=`pwd`

#link vim source
[ -f ~/.gitconfig ] || ln -s $PWD/gitconfig ~/.gitconfig
[ -f ~/.vim ] || ln -s $PWD/vim ~/.vim
[ -f ~/.vimrc ] || ln -s $PWD/vimrc ~/.vimrc
[ -f ~/.bashrc ] || ln -s $PWD/.bashrc ~/.bashrc
[ -f ~/.screenrc ] || ln -s $PWD/.screenrc ~/.screenrc
[ -f ~/.dir_colors ] || ln -s $PWD/.dir_colors ~/.dir_colors

#install nerdtree
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
