fpath=($DOTS/zsh/functions $fpath)
autoload -U $DOTS/zsh/functions/*(:t)

bindkey -v
bindkey '^N' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[[A' history-beginning-search-backward
