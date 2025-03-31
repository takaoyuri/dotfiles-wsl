#!/bin/bash

# Create symbolic link for .bashrc in home directory
ln -sf "$(pwd)/.bashrc" "$HOME/.bashrc"
# .exports
ln -sf "$(pwd)/.exports" "$HOME/.exports"
# .aliases
ln -sf "$(pwd)/.aliases" "$HOME/.aliases"
# .bash_profile
ln -sf "$(pwd)/.bash_profile" "$HOME/.bash_profile"
# .bash_prompt
ln -sf "$(pwd)/.bash_prompt" "$HOME/.bash_prompt"
# .dockerfunc
ln -sf "$(pwd)/.dockerfunc" "$HOME/.dockerfunc"
# .inputrc
ln -sf "$(pwd)/.inputrc" "$HOME/.inputrc"

# Create LazyVim configuration directory
mkdir -p "$HOME/.config/nvim"

# Clone LazyVim starter repository if not exists
if [ ! -d "$HOME/.config/nvim/.git" ]; then
    echo "Setting up LazyVim..."
    # Backup existing config if any
    if [ -d "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
        mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
        echo "Backed up existing nvim config to $HOME/.config/nvim.bak"
    fi
    
    # Clone LazyVim starter
    git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
    # Remove .git directory to avoid conflicts
    rm -rf "$HOME/.config/nvim/.git"
    echo "LazyVim has been installed successfully!"
else
    echo "LazyVim is already installed"
fi

# Link custom LazyVim configurations if they exist
if [ -d "$(pwd)/nvim" ]; then
    # Link specific config files from dotfiles to LazyVim
    for file in $(pwd)/nvim/*; do
        if [ -f "$file" ]; then
            ln -sf "$file" "$HOME/.config/nvim/$(basename "$file")"
        fi
    done
    echo "LazyVim custom configurations linked"
fi