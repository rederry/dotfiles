# python path
export PYTHONPATH=.

# vps
alias vps='mosh rederry@35.221.190.54'

# kcp
alias kcpstart='launchctl load ~/Library/LaunchAgents/kcptun.plist'
alias kcpstop='launchctl unload ~/Library/LaunchAgents/kcptun.plist'

# convenient
ipad(){
    curl ip.cn/$1
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

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Developer/www
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/bin/virtualenvwrapper.sh

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# Fix homebrew python path
alias lldb="PATH=/System/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH lldb"
alias swift="PATH=/System/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH swift"
