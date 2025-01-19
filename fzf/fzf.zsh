# Set up fzf key bindings and fuzzy completion
autoload is-at-least
if is-at-least 0.48.0 $(fzf --version); then
  source <(fzf --zsh)
fi
