brew_path="/opt/homebrew/bin/brew"

if [[ -f "$brew_path" ]]; then
  eval "$($brew_path shellenv)"
fi

unset brew_path
