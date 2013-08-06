# The rest of my fun git aliases
alias gf='git fetch --all -p'
alias gm='git merge --no-ff'
alias gl='git pull --prune'
alias glr='git pull --rebase'
alias gp='git push origin HEAD'
alias gd='git diff'
alias gs='git status -sb'
alias ga='git add -A'
alias gr='git reset'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias stage="git push staging develop:develop"
alias deploy="git push production master:master"
alias gmt="git mergetool"
alias gdt="git difftool"
