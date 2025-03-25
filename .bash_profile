# Q pre block. Keep at the top of this file.
echo ".bash_profile start"
if [[ -r "${HOME}/.bashrc" ]]; then
  source "${HOME}/.bashrc"
fi
echo ".bash_profile end"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.bash 2>/dev/null || :

# Q post block. Keep at the bottom of this file.
