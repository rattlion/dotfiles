if [[ $+commands[python3] == 1 ]]
then
  python="$commands[python3]"
else
  python="$commands[python]"
fi
export PATH=`$python -m site --user-base`/bin:$PATH
