autoload colors && colors

if [[ $+commands[git] == 1 ]]
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_dirty() {
  st=$($git status 2>/dev/null | tail -n 2)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ "$st" =~ clean ]]
    then
      echo "on %{$fg[green]%}$(git_get_head_ref)%{$reset_color%}"
    else
      echo "on %{$fg[red]%}$(git_get_head_ref)%{$reset_color%}"
    fi
  fi
}

git_get_current_branch() {
  $git symbolic-ref -q --short HEAD
}

git_get_current_tag() {
  echo "tag: $($git describe --tags --exact-match)"
}

git_get_head_ref () {
  git_get_current_branch || git_get_current_tag
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  st=$($git status 2>/dev/null)
  if [[ $st =~ "diverged" ]]; then
    echo "%{$fg[red]%}💥%{$reset_color%}"
  elif [[ $st =~ "ahead" ]] ; then
    echo "%{$fg[yellow]%}⚡️%{$reset_color%}"
  elif [[ $st =~ "behind" ]] ; then
    echo "%{$fg[white]%}✨%{$reset_color%}"
  fi
}

directory_name() {
  echo "%{$fg[blue]%}%1/%{$reset_color%}"
}

machine_name() {
  echo "%{$fg_bold[magenta]%}%M:%{$reset_color%}"
}

user_name() {
  echo "%{$fg[yellow]%}%n%{$reset_color%}"
}

host_name() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "%{$fg[yellow]%}@%m%{$reset_color%}"
  fi
}

rb_prompt() {
  echo "%{$fg[red]%}⬢%{$reset_color%} %{$fg_bold[grey]%}$(asdf current ruby | awk '{print $2}')%{$reset_color%}"
}

node_prompt() {
  echo "%{$fg[green]%}⬢%{$reset_color%} %{$fg_bold[grey]%}$(asdf current nodejs | awk '{print $2}')%{$reset_color%}"
}

r_prompt() {
  if (( $+commands[asdf] ))
  then
    echo "$(node_prompt) $(rb_prompt)"
  else
    echo "Missing asdf"
  fi
}

export PROMPT=$'$(user_name)$(host_name) in $(directory_name) $(git_dirty) $(need_push)\n%{$fg_bold[white]%}➜ %{$reset_color%}'
set_prompt() {
  export RPROMPT="$(r_prompt)"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
