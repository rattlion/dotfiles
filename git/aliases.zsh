# Aliases
alias g='git'
alias gi="git init"
alias ga='git add -A :/'
alias gb='git branch'
alias gba='git branch -a'
alias gc!='git commit -v --amend'
alias gc='git commit -v'
alias gca!='git commit -v -a --amend'
alias gca='git commit -v -a'
alias gcl='git config --list'
alias gclean='git reset --hard && git clean -dfx'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdt="git difftool"
alias gf='git fetch --all -p'
alias gl='git pull --prune'
alias glr='git pull --rebase'
alias gm='git merge --no-ff'
alias gmt="git mergetool --no-prompt"
alias gp='git push origin HEAD'
alias gp!='git push origin HEAD -f'
alias gr='git reset'
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD'
alias gs='git status -sb'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias stage="git push staging develop:develop"
alias deploy="git push production master:master"
