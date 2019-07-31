# vps
alias sgcp='mosh rederry@34.80.149.174'
alias s76='ssh root@47.97.203.76'
alias s206='ssh root@47.97.237.206'
alias shb='ssh root@118.31.3.34'
alias sxy='ssh root@120.26.42.102'
alias shy='ssh root@120.26.49.166'

# kcp
alias kcpstart='launchctl load ~/Library/LaunchAgents/kcptun.plist'
alias kcpstop='launchctl unload ~/Library/LaunchAgents/kcptun.plist'

# convenient
ipad(){
    curl cip.cc/$1
}

alias ipy="ipython"
alias py="python"

alias px='export http_proxy=http://0.0.0.0:1087;export https_proxy=http://0.0.0.0:1087;'
alias rmpx='export http_proxy=;export https_proxy=;'
alias gpx='git config --global http.proxy http://127.0.0.1:1087'
alias rmgpx='git config --global --unset http.proxy'

alias vrc='vim ~/.vimrc'
alias zrc='vim ~/.zshrc'
alias brc='vim ~/.bash_profile'
alias src='source ~/.zshrc'
alias vi='vim --noplugin'
alias ec='emacsclient'
alias dps='docker ps'

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Developer/www
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/bin/virtualenvwrapper.sh

# python path
export PYTHONPATH=.
# go path
export GOPATH=$HOME/Developer/go

# Homebrew
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

# Fix homebrew's python path
alias lldb="PATH=/System/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH lldb"
alias swift="PATH=/System/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH swift"
