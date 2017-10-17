# mysql
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'

# ls
alias ll='ls -lh'

# emacs
alias emacs="emacs-25.3"

# grep highlight
export GREP_OPTIONS='--color=auto'

MAIL_USERNAME='rederry@sina.com'
export MAIL_USERNAME

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for SML
export PATH="$PATH:/usr/local/smlnj/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# homebrew
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export PATH="/usr/local/sbin:$PATH"

# bwh vps
alias vps='ssh root@rederry.me -p 22'
alias vps2='ssh kangkang@rederry.me -p 22'

# kcp
alias kcpstart='launchctl load ~/Library/LaunchAgents/kcptun.plist'
alias kcpstop='launchctl unload ~/Library/LaunchAgents/kcptun.plist'
