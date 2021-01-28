if hash aws_completer 2>/dev/null
then
  complete -C $(which aws_completer) aws
fi
