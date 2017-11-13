export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)
autoload -U zmv

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt INTERACTIVECOMMENTS
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

zle -N newtab

bindkey -v
bindkey '^N' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[Z' reverse-menu-complete
bindkey -a u undo
