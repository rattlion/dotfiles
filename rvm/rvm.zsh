[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias rubies='rvm list rubies'
alias gemsets='rvm gemset list'
