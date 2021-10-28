echo ".bash_profile start"

if [[ -r "${HOME}/.bashrc" ]]; then
  source "${HOME}/.bashrc"
fi

echo ".bash_profile end"
