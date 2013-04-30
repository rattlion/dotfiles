# Composer basic command completion
_composer_get_command_list () {
	composer --no-ansi | sed "1,/Available commands/d" | awk '/^  [a-z]+/ { print $1 }'
}

_composer () {
  compadd `_composer_get_command_list`
}

compdef _composer composer
