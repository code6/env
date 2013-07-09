#!/bin/bash

create_dir()
{
   dir=$1
   echo "Create dir: " $dir
   [ -d $dir ] || mkdir -p $dir
}

link_script()
{
    sourcedir=$1
    shift
    targetdir=$1
    shift
    list=("${@}") 
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
    "git-completion.bash"
    "git-flow-completion.bash"
);
link_script $PWD $BINDIR "${BIN_SCRIPT_LIST[@]}" 

HOME_SCRIPT_LIST=(
    ".gitconfig"
    ".vimrc"
    ".vim"
    ".bashrc"
    ".screenrc"
    ".dir_colors"
);
link_script $PWD $HOME "${HOME_SCRIPT_LIST[@]}" 


#soft 
#brew install screen
#brew install coreutils --default-names
#sudo easy_install pip

#install nerdtree
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git

#other package
