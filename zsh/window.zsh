# Sets the window title nicely no matter where you are
function title() {
  # escape '%' chars in $1, make nonprintables visible
  local a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")
  
  print -Pn "\e]2;$a - $2\a"

  # Set the tmux window name (shorter version for the tmux status bar)
  if [[ -n "$TMUX" ]]; then
    print -Pn "\ek$a\e\\"
  fi
}

precmd() {
  title "zsh" "%m(%~)" "%~"
}

preexec() {
  title "$1" "%m(%~)" "%~"
}
