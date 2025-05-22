autoload colors && colors

user_name() {
  echo "%{$fg[yellow]%}%n%{$reset_color%}"
}

host_name() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "%{$fg[yellow]%}@%m%{$reset_color%}"
  fi
}

if [[ $+commands[git] == 1 ]]
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_get_current_branch() {
  $git symbolic-ref -q --short HEAD
}

git_get_current_tag() {
  echo "tag: $($git describe --tags --exact-match)"
}

git_get_head_ref () {
  git_get_current_branch || git_get_current_tag
}

git_remote_diff () {
  st=$($git status 2>/dev/null)
  case $st in
    *diverged*) 
      echo "%{$fg[red]%}%{$reset_color%}"
      ;;
    *ahead*) 
      echo "%{$fg[yellow]%}󱐋%{$reset_color%}"
      ;;
    *behind*) 
      echo "%{$fg[white]%}%{$reset_color%}"
      ;;
  esac
}

git_status() {
  st=$($git status 2>/dev/null | tail -n 2)
  if [[ $st != "" ]]
  then
    if [[ "$st" =~ clean ]]
    then
      echo "on %{$fg[green]%}$(git_get_head_ref)%{$reset_color%} $(git_remote_diff)"
    else
      echo "on %{$fg[red]%}$(git_get_head_ref)%{$reset_color%} $(git_remote_diff)"
    fi
  fi
}

directory_name() {
  echo "%{$fg_bold[blue]%}%1/%{$reset_color%}"
}

arrow_line() {
 echo "%{$fg_bold[white]%}\n %{$reset_color%}"
}

export PROMPT=$'$(user_name)$(host_name) in $(directory_name) $(git_status) $(arrow_line)'

