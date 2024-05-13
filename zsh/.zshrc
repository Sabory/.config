plugins=(
  docker
  git
  virtualenv
  rails
  ruby
  poetry
)

# Import zsh own modules
[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/completions.zsh ]] && source ~/.config/zsh/completions.zsh
[[ -f ~/.config/zsh/exports.zsh ]] && source ~/.config/zsh/exports.zsh
[[ -f ~/.config/zsh//private/init.zsh ]] && source ~/.config/zsh//private/init.zsh

[[ -f ~/.config/zsh/plugins/git-custom.zsh ]] && source ~/.config/zsh/plugins/git-custom.zsh
[[ -f ~/.config/zsh/plugins/fzf.zsh ]] && source ~/.config/zsh/plugins/fzf.zsh
[[ -f ~/.config/zsh/plugins/ssh.zsh ]] && source ~/.config/zsh/plugins/ssh.zsh

# Needed for fzf-tab plugin (https://github.com/Aloxaf/fzf-tab?tab=readme-ov-file)
autoload -U compinit; compinit
[[ -f ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ]] && source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh


# Python venv
eval "$(pyenv init -)"

# Ruby venv
eval "$(rbenv init -)"

# Node venv
eval "$(nodenv init -)"

# Zoxide: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# Created by `pipx` on 2023-11-05 19:29:13
export PATH="$PATH:/Users/jignacio/.local/bin"

# direnv hook instalation
eval "$(direnv hook zsh)"

# The fuck (autocorrect last command run with typo on it)
eval $(thefuck --alias)

# Better history search
eval "$(atuin init zsh)"

# Startship Shell (this has to be at the end of the file)
eval "$(starship init zsh)"

