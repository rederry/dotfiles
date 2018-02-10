# ls
alias ll='ls -lG'

# emacs
# alias emacs="emacs-25.3"

# grep highlight
export GREP_OPTIONS='--color=auto'

# Setting PATH for SML
export PATH="$PATH:/usr/local/smlnj/bin"

# homebrew
export PATH="/usr/local/sbin:$PATH"

# vps
alias vultr='ssh root@rederry.me'
alias vultrkk='ssh kangkang@rederry.me'

# kcp
alias kcpstart='launchctl load ~/Library/LaunchAgents/kcptun.plist'
alias kcpstop='launchctl unload ~/Library/LaunchAgents/kcptun.plist'

# Git
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gc="git checkout"
alias gst="git status"
alias gcl="git clone"
alias gcm="git commit -m"

# convenient
ip(){
   curl ip.cn/$1 
}

alias px='export http_proxy=http://0.0.0.0:1087;export https_proxy=http://0.0.0.0:1087;'
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bash_profile'
alias sourceb='source ~/.bash_profile'
