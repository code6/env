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
    "bashmarks.sh"
);
link_script $PWD $BINDIR "${BIN_SCRIPT_LIST[@]}" 

HOME_SCRIPT_LIST=(
    ".gitconfig"
    ".vimrc"
    ".vim"
    ".bashrc"
    ".screenrc"
    ".dir_colors"
    ".tmux.conf"
);
link_script $PWD $HOME "${HOME_SCRIPT_LIST[@]}" 

# create bash history dir
mkdir  ~/.history

# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#soft
sudo xcodebuild -license
#install xcode command line tools
xcode-select --install
#ruby
curl -L https://get.rvm.io | bash -s stable --ruby

#brew
# install homebrew
cd ~ && mkdir homebrew && curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C homebrew
source ~/.bashrc
brew install tmux
brew install python
pip install --upgrade distribute
pip install --upgrade pip
pip install virtualenv
pip install virtualenvwrapper
#mysql
brew install mysql
brew install node
#ipython
brew update # Always good to do
brew install zeromq # Necessary for pyzmq
brew install pyqt # Necessary for the qtconsole
#refer https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
#brew install coreutils --default-names


#other package

