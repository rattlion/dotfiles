# complete file extensions, compdef funcs, and attempt to fix misspellings
zstyle ':completion:*' completer _extensions _expand_alias _complete _approximate

# highlight the currently selected option in the menu
zstyle ':completion:*' menu select

# matches case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# some light completion styling
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''
