#!/bin/bash

create_dir()
{
   dir=$1
   echo "Create dir: " $dir
   [ -d $dir ] || mkdir -p $dir
}

link_script()
{
    list=$1
    sourcedir=$2
    targetdir=$3
    for s in "${list[@]}"
    do
        echo "link $s"
        [ -f $targetdir/$s ] || ln -s $sourcedir/$s  $targetdir/$s
    done
}

PWD=`pwd`
GITDIR=$HOME/git
BINDIR=$HOME/bin

##build ~/bin
create_dir $BINDIR
BIN_SCRIPT_LIST=(
    "git-completion.bash",
    "git-flow-completion.bash",
);
link_script $BIN_SCRIPT_LIST $PWD $BINDIR


HOME_SCRIPT_LIST=(
    ".gitconfig",
    ".vimrc",
    ".bashrc",
    ".screenrc",
    ".dir_colors",
);
link_script $HOME_SCRIPT_LIST $PWD $HOME



#soft 
brew install screen

#install nerdtree
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git

#other package
