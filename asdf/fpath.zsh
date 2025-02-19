# necessary completion install steps
# $ mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
# $ asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
