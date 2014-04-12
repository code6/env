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
alias scp='scp -c arcfour'

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
source $HOME/bin/bashmarks.sh
workon dev

PATH=/usr/local/bin/:$PATH:$HOME/git/arcanist/bin:$HOME/.rvm/bin # Add RVM to PATH for scripting

export ANT_HOME=/Users/code6/Downloads/apache-ant-1.8.2/
PATH=$PATH:$ANT_HOME/bin


#export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"
