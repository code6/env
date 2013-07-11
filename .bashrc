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

source $HOME/bin/git-completion.bash
source $HOME/bin/git-flow-completion.bash


alias ll='ls -AlG'
alias ls='ls -lG'
alias vi='vim'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export EDITOR=vi

alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d_\d\d" | cut -d , -f 1 | colrm 1 4 | grep -v Home'

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
        java -version
    }

java_use 1.6 1>/dev/null 2>&1

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code6
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python"
source /usr/local/bin/virtualenvwrapper.sh
workon dev

