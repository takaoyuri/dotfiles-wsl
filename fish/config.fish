set fish_greeting ""

# make Vim the default editor
set --export EDITOR "nvim"

# make Vim usable with git
set --export GIT_EDITOR "nvim"

# alias
if [ -f $HOME/.config/fish/aliases.fish ]
	. $HOME/.config/fish/aliases.fish
end

# pyenv 
if [ -f $HOME/.pyenv/bin ]
	set -x PATH $HOME/.pyenv/bin $PATH
	. (pyenv init -l psub)
end

# $DISPLAY
set -x DISPLAY localhost:0.0

function fish_prompt
	if [ $status -eq 0 ]
		set status_face (set_color green -b black)">"(set_color -b normal)
	else
		set status_face (set_color red -b black)">>"(set_color -b normal)
	end

	set prompt (set_color yellow)(prompt_pwd)

	echo $prompt
	echo $status_face
end
