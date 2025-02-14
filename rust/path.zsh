cargo_path="$HOME/.cargo/env"

if [[ -f "$cargo_path" ]]; then
  source $cargo_path
fi

unset cargo_path
