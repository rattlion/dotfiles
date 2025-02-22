if [ -f ~/.fzf.zsh ]; then 
  source ~/.fzf.zsh
else
  autoload is-at-least
  if is-at-least 0.48.0 $(fzf --version); then
    source <(fzf --zsh)
  fi
fi
