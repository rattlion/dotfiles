# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if [[ -f $hub_path ]]
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gf='git fetch --all -p'
alias gm='git merge --no-ff'
alias gl='git pull --prune'
alias gp='git push origin HEAD'
alias gd='git diff'
alias gs='git status -sb'
alias ga='git add -A'
alias gr='git reset'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
