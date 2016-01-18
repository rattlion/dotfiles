autoload colors && colors

if [[ $+commands[git] == 1 ]]
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($git status 2>/dev/null | tail -n 2)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ "$st" =~ clean ]]
    then
      echo "on %{$fg[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  st=$($git status 2>/dev/null)
  if [[ $st =~ "diverged" ]]; then
    echo "💥"
  elif [[ $st =~ "ahead" ]] ; then
    echo "⚡️"
  elif [[ $st =~ "behind" ]] ; then
    echo "✨"
  fi
}

directory_name() {
  echo "%{$fg[blue]%}%1/%\/%{$reset_color%}"
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

ruby_version() {
  if (( $+commands[rvm-prompt] ))
  then
    echo "$(rvm-prompt v g p | awk '{print $1}')"
  fi
}

rb_prompt() {
  if ! [[ -z "$(ruby_version)" ]]
  then
    echo "%{$fg[red]%}⬢%{$reset_color%} %{$fg_bold[grey]%}$(ruby_version)%{$reset_color%}"
  else
    echo ""
  fi
}

node_version() {
  if (( $+commands[node] ))
  then
    echo "$(node -v | cut -c 2-)"
  fi
}

node_prompt() {
  echo "%{$fg[green]%}⬢%{$reset_color%}%{$fg_bold[grey]%} $(node_version)%{$reset_color%}"
}

r_prompt() {
  echo "$(node_prompt) $(rb_prompt)"
}

export PROMPT=$'$(user_name)$(host_name) in $(directory_name) $(git_dirty) $(need_push)\n%{$fg_bold[white]%}➜ %{$reset_color%}'
set_prompt() {
  export RPROMPT="$(r_prompt)"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
