# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH=$PATH:$HOME/bin

# User specific aliases and functions

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' -e 's/((/(/' -e 's/))/)/'
}
function proml {
    local GREEN="\[\033[0;32m\]"
    local COLOR_END="\033[0m"
    PS1="[\u@\h:\W$GREEN\$(parse_git_branch)$COLOR_END]\$ "
}
proml

source ~/bin/git-completion.bash
source ~/bin/git-flow-completion.bash


alias ll='ls -AlG'
alias ls='ls -lG'
alias vi='vim'
