#! bin/sh

# Create symbolic link to zsh config file
ln -s ~/.config/zsh/.zshrc ~/.zshrc

# Create symbolic link to git config gile
ln -s ~/.config/git/.gitconfig ~/.gitconfig

# Create symbolic link to IdeaVim config file
ln -s ~/.config/idea/.ideavimrc ~/.ideavimrc

# installs
brew install nvim fzf eza starship fd lazygit ripgrep cmake atuin tmuxp git-delta
