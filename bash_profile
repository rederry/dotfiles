# ls
alias ll='ls -lG'

# grep highlight
export GREP_OPTIONS='--color=auto'

export PS1='\h:\W\$ '

# SML
export PATH="$PATH:/usr/local/smlnj/bin"

# homebrew
export PATH="/usr/local/sbin:$PATH"

# kcp
alias kcpstart='launchctl load ~/Library/LaunchAgents/kcptun.plist'
alias kcpstop='launchctl unload ~/Library/LaunchAgents/kcptun.plist'

# Git
alias glol="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gco="git checkout"
alias gst="git status"
alias gcl="git clone"
alias gcmsg="git commit -m"

# convenient
ip(){
   curl ip.cn/$1 
}

alias px='export http_proxy=http://0.0.0.0:1087;export https_proxy=http://0.0.0.0:1087;'
alias rmpx='export http_proxy=;export https_proxy=;'
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bash_profile'
alias src='source ~/.bash_profile'

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Developer/www
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
export PYTHONPATH=.
